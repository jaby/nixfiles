# Nix files 

## Initial setup

Cfr also: ial-getting-started-with-home-manager-for-nix
 

### Install nix for a single user 

    rm -rf /nix
    sudo rm -rf /nix
    mkdir /nix
    sudo mkdir /nix
    chown peter /nix 
    sudo chown peter /nix
    sh <(curl -L https://nixos.org/nix/install) --no-daemon


### git clone my nix files

    cd ~
    git clone TODO/nixfiles 


### Install home manager 

    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install

#### And symlink to my nixfiles

    cd ~/.config/
    mv nixpkgs /tmp            # ~/config/nixpkgs was created by the installation of home-manager 
    ln -s ~/nixfiles nixpkgs   # replace it with my cloned nixfiles
    home-manager switch        # switch to build the cloned configuration 
