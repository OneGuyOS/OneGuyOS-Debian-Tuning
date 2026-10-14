# OneGuy.OS — Debian 13 (Trixie) & KDE Plasma 6 Tuning Release Bundle (v1.0.0)

Welcome to the complete, official release bundle for the **OneGuy.OS** deep system optimization campaign, engineered specifically for the **Dell Latitude 5420** (11th Gen Intel Core i7-1185G7 with Iris Xe Graphics, 32 GB DDR4, and PCIe 3.0 NVMe storage).

---

## What is Inside this Release Bundle

### 1. `packages/` — Production Debian Packages
* **`oneguy-debian-tuning_1.0.0_all.deb`**: The core system tuning package uniting all 13 verified software levers:
  - 16 GiB ZRAM Zstd compressed memory tier (`zram.service`)
  - Dynamic AC (54W) / Battery (15W) RAPL power governor (`oneguy-power-profile`, `oneguy-power.service`, and udev rules)
  - 2,048 KB NVMe read-ahead with queue affinity core pinning (`99-nvme-readahead.rules`)
  - 3ms CFS/EEVDF low-latency scheduler execution slices (`99-scheduler-slice.conf`)
  - Dynamic full kernel preemption (`sched-preempt.service`)
  - BBR TCP congestion control & VFS dirty page smoothing (`99-network-vfs-throughput.conf`)
  - Mesa 4GB persistent disk shader cache & glthread (`99-mesa-tuning.conf`)
  - 10-second systemd shutdown timeout (`10-shutdown-timeout.conf`)
  - Intel DTT thermal throttle blacklist (`disable-dtt.conf`)
  - 0ms KDE Plasma 6 KWin instant animation transitions
* **`linux-image-7.2.10-oneguy-bore-v3_7.2.10-1_amd64.deb`**: Custom upstream stable Linux 7.2.10 kernel image tailored with `x86-64-v3` architecture, BORE 7.0.0 burst scheduler, TEO cpuidle governor, 1000 Hz hard tick rate, and stripped of 92.5% module bloat (298 drivers).
* **`linux-headers-7.2.10-oneguy-bore-v3_7.2.10-1_amd64.deb`**: C header package for compiling out-of-tree kernel modules.

### 2. `docs/` — Full Documentation Suite
* **`OneGuyOS-Debian-Manual.pdf`**: Publication-grade, full-color 11-page system manual containing architectural diagrams, empirical benchmark matrices across all 30 testing phases, step-by-step setup recipes, operational guidance, and material limitations.
* **`OneGuyOS-Debian-Manual.html`**: Interactive HTML companion to the PDF manual.
* **`TUNING-DASHBOARD.html`**: Live, standalone interactive HTML dashboard featuring Chart.js visual metrics, system snapshots, and complete benchmark histories.
* **`ENGINEERING-LOG.md`**: Complete, unfiltered 85KB engineering audit trail detailing all tested knobs, keepers, rejected tweaks, and diagnostic telemetry.

### 3. `media/` — Social Media & Presentation Assets
* **`Debian-KDE-Tuning-Stats-Card.png`**: High-resolution 1200×675 cyber-HUD infographic displaying verified performance deltas, before/after metrics, and scalable wattage callouts.
* **`debian_kde_supercharged_engine.jpg`**: 3D concept artwork of an exposed twin-turbo cybernetic V8 engine with glowing Debian and KDE emblems.
* **`debian_kde_warp_cockpit.jpg`**: Sci-fi cockpit artwork breaking the light-speed barrier with holographic Debian & KDE telemetry HUDs.
* **`Debian-KDE-Tuning-FB-Card.png`**: Minimalist landscape social card.
* **`facebook_post.txt`**: Clean, copy-paste ready text for Facebook and community forums.

### 4. `scripts/` — Standalone Utilities
* **`oneguy-power-profile`**: CLI utility for monitoring and switching power envelopes.

---

## 🚀 Quick Start / 1-Click Installation

To deploy the entire suite (tuning package, custom kernel, and GRUB bootloader integration):

```bash
sudo ./install.sh
```

### To Uninstall / Rollback:
```bash
sudo ./uninstall.sh
```

---

## Power Profile Commands
Once installed, use the included CLI tool to check or switch power modes:
```bash
# Check current power limits, wattage, and thermals
oneguy-power-profile status

# Force 54W AC Workstation mode (Max compute)
sudo oneguy-power-profile ac

# Force 15W Battery mode (Cool, silent, long battery life)
sudo oneguy-power-profile battery

# Revert to Dell 40W factory stock envelope
sudo oneguy-power-profile stock

# Auto-detect AC vs. Battery power
sudo oneguy-power-profile auto
```
