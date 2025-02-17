{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ./stylix

    ../common/users/defined
    ../common/global

    ../common/optional/nvidia.nix
    ../common/optional/kde.nix
    ../common/optional/pipewire.nix
    ../common/optional/flatpak.nix
    ../common/optional/fail2ban.nix
    ../common/optional/quietboot.nix
    ../common/optional/ssd.nix
    ../common/optional/gamemode.nix
    ../common/optional/fwupd.nix
  ];

  networking.hostName = "definedos";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.zsh.enable = true;
  users.users.defined.shell = pkgs.zsh;

  system.stateVersion = "24.11";
}
