#!/bin/bash
# OneGuyOS Release Installer: Installs system tuning package, kernel, and dependencies
set -e

if [ "$EUID" -ne 0 ]; then
  echo "[!] Please run with root privileges: sudo ./install.sh"
  exit 1
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo "================================================================="
echo "       OneGuy.OS Debian 13 & KDE Plasma 6 Release Installer      "
echo "================================================================="

echo "[1/4] Installing OneGuyOS System Tuning Suite (.deb)..."
dpkg -i "$DIR/packages/oneguy-debian-tuning_1.0.0_all.deb" || apt-get install -f -y

echo "[2/4] Installing Custom Linux 7.2.10 BORE Kernel (.deb)..."
dpkg -i "$DIR/packages/linux-image-7.2.10-oneguy-bore-v3_7.2.10-1_amd64.deb" \
        "$DIR/packages/linux-headers-7.2.10-oneguy-bore-v3_7.2.10-1_amd64.deb" || apt-get install -f -y

echo "[3/4] Updating GRUB bootloader configuration..."
if grep -q "cpuidle.governor=teo" /etc/default/grub; then
    echo "  -> GRUB command line already configured."
else
    sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet preempt=full mitigations=off cpuidle.governor=teo"/' /etc/default/grub
fi
update-grub

echo "[4/4] Activating System Services & Power Profile..."
systemctl daemon-reload
systemctl enable --now zram.service
systemctl enable --now sched-preempt.service
systemctl enable --now oneguy-power.service
/usr/local/bin/oneguy-power-profile auto

echo "================================================================="
echo "[✓] OneGuy.OS Release Installation Complete!"
echo "    - 16GB Zstd ZRAM memory tier active"
echo "    - Dynamic AC (54W) / Battery (15W) power governor active"
echo "    - NVMe direct 2048KB readahead & rq_affinity=2 active"
echo "    - 3ms CFS/EEVDF scheduler slices active"
echo "    - KDE Plasma 6 0ms instant animations active"
echo "    - Full PDF Manual available in docs/OneGuyOS-Debian-Manual.pdf"
echo "    - Interactive Dashboard in docs/TUNING-DASHBOARD.html"
echo ""
echo "Reboot to enter the custom Linux 7.2.10 BORE kernel!"
echo "================================================================="
