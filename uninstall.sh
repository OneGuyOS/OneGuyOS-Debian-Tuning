#!/bin/bash
# OneGuyOS Release Uninstaller: Safely removes tuning layers and restores defaults
set -e

if [ "$EUID" -ne 0 ]; then
  echo "[!] Please run with root privileges: sudo ./uninstall.sh"
  exit 1
fi

echo "================================================================="
echo "       OneGuy.OS Debian 13 & KDE Plasma 6 Uninstaller            "
echo "================================================================="

echo "[1/3] Removing OneGuyOS Tuning Package..."
dpkg -r oneguy-debian-tuning 2>/dev/null || true

echo "[2/3] Restoring default kernel in GRUB..."
sed -i 's/preempt=full mitigations=off cpuidle.governor=teo//' /etc/default/grub
update-grub

echo "[3/3] Reloading system configurations..."
systemctl daemon-reload
udevadm control --reload-rules

echo "================================================================="
echo "[✓] OneGuy.OS tuning removed and default baseline restored."
echo "================================================================="
