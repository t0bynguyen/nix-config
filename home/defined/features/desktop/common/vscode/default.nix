{
  unstable-pkgs,
  lib,
  system,
  inputs,
  ...
}:
let
  vscode-marketplace = inputs.nix-vscode-extensions.extensions.${system}.vscode-marketplace;
  plugins = (import ./extensions.nix) {
    pkgs = unstable-pkgs;
    lib = lib;
  };
in
{
  imports = [
    ./keybindings.nix
  ];

  programs.vscode = {
    enable = true;

    userSettings = lib.mkForce (builtins.fromJSON (builtins.readFile ./settings.json));

    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with vscode-marketplace; [
      plugins.streetsidesoftware.code-spell-checker
      plugins.christian-kohler.path-intellisense
      plugins.ritwickdey.liveserver
      plugins.yoavbls.pretty-ts-errors
      plugins.catppuccin.catppuccin-vsc
      plugins.esbenp.prettier-vscode
      plugins.mkhl.direnv
      plugins.formulahendry.auto-rename-tag
      plugins.christian-kohler.npm-intellisense
      plugins.formulahendry.auto-close-tag
      plugins.jnoortheen.nix-ide
      plugins.pkief.material-icon-theme
      plugins.eamodio.gitlens
      plugins.ziglang.vscode-zig
      plugins.dsznajder.es7-react-js-snippets
      plugins.aaron-bond.better-comments
      plugins.alefragnani.project-manager
      plugins.formulahendry.auto-complete-tag
      plugins.tamasfe.even-better-toml
      plugins.bradlc.vscode-tailwindcss
      plugins.nefrob.vscode-just-syntax
      plugins.editorconfig.editorconfig
      plugins.foxundermoon.shell-format
      plugins.dbaeumer.vscode-eslint
      plugins.ms-vscode.cpptools
      plugins.supermaven.supermaven
      plugins.rust-lang.rust-analyzer
    ];
  };
}
