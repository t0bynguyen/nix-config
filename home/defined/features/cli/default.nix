{
  pkgs,
  unstable-pkgs,
  system,
  inputs,
  ...
}:
{
  imports = [
    ./zsh
    ./neovim
    ./git.nix
    ./fzf.nix
    ./gpg.nix
    ./fastfetch
    ./nh.nix
    ./direnv.nix
  ];

  home.packages =
    with pkgs;
    [
      bottom # System viewer
      eza # Better ls
      ripgrep # Better grep
      bat # Better cat
      aria2 # Better curl
      yt-dlp # YouTube dlp
      dust # Better du
      nitch # System fetch
      cava # Audio visualizer
      just # Command runner
      ffmpeg # Media converter
      spotify-player # Spotify player
      feh # Image viewer

      nixd # Nix LSP
      nix-init
    ]
    ++ (with unstable-pkgs; [
      bun
      deno
    ])
    ++ [
      inputs.alejandra.defaultPackage.${system} # Nix formatter
    ];
}
