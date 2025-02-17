{
  lib,
  config,
  pkgs,
  ...
}: {
  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [];
    };

    kernelPackages = pkgs.linuxPackages_6_12;
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];

    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/38a2a750-443d-4687-b56e-618d0942f6f3";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/C184-5B76";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/mnt/secondary" = {
      device = "/dev/disk/by-uuid/1436e7d0-a6d6-418f-b90c-b31f41af0a7b";
      fsType = "btrfs";
    };

    "/mnt/tertiary" = {
      device = "/dev/disk/by-uuid/e2888cda-afa7-4c44-98ac-0c7658932bf7";
      fsType = "btrfs";
    };
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 1024 * 24;
    }
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
