{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "peter";
  home.homeDirectory = "/home/peter";

  # Packages to install
  home.packages = [
    # pkgs is the set of all packages in the default home.nix implementation
    pkgs.vim 
    #pkgs.neovim 
    pkgs.git
    pkgs.ripgrep
    pkgs.fzf
    pkgs.wget
    pkgs.firefox
  ];

  # Raw configuration files
  home.file.".vimrc".source = ./vimrc;
  home.file.".bashrc".source = ./bashrc;
  home.file.".bash_aliases".source = ./bash_aliases;

  # Git config using Home Manager modules
  programs.git = {
    enable = true;
    userName = "dvelderp";
    userEmail = "peter.de.velder@gmail.com";
    aliases = {
      st = "status";
    };
  };

  #programs.neovim = {
  #  enable = true;
  #  viAlias = true;
  #  vimAlias = true;
  #  vimdiffAlias = true;
  #  withNodeJs = true;
  #  withPython3 = true;
  #  withRuby = true;

  #  plugins = with pkgs.vimPlugins; [
  #    ack-vim
  #    coc-highlight
  #    coc-nvim
  #    coc-rust-analyzer
  #    ctrlp-vim
  #    editorconfig-vim
  #    fzf-vim
  #    nerdtree
  #    nerdtree-git-plugin
  #    quickfix-reflector-vim
  #    rainbow
  #    tabular
  #    vim-airline
  #    vim-airline-themes
  #    vim-autoformat
  #    vim-colors-solarized
  #    vim-devicons
  #    vim-dirdiff
  #    vim-dispatch
  #    vim-fugitive
  #    vim-gitgutter
  #    vim-markdown
  #    vim-nix
  #    vim-sensible
  #    vim-startify
  #    vim-surround
  #    vim-toml
  #  ];
  #  extraConfig = ''
  #    if filereadable($HOME . "/.vimrc")
  #      source $HOME/.vimrc
  #    endif
  #  '';
  #};

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

}
