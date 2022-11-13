# Sets up the dotfiles

# If we are not in the home-directory, exit
if [ ! -d "$HOME" ]; then
    echo "Not in home directory"
    exit 1
fi

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install homebrew bundle
brew tap Homebrew/bundle

# Install homebrew packages
brew bundle

# Set zsh as default shell
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Symlink the dotfiles
rm -rf ~/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

rm -rf ~/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

rm -rf ~/.starship.toml
ln -s $HOME/.dotfiles/.starship.toml $HOME/.starship.toml

rm -rf ~/.asdfrc
ln -s $HOME/.dotfiles/.asdfrc $HOME/.asdfrc

# Install warp if not already installed
brew install warp

# Install my custom warp theme
curl -s -N 'https://warp-themes.com/d/MUSDS6lF9k8BmIFiAWo0' | bash

# Install asdf for nodejs
asdf plugin add nodejs
asdf install nodejs lts
asdf global nodejs lts

