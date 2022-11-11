# ⚙️ Dotfiles

> Note that this repository is very mac-heavy. It **will not** work on other machines.

## 📦 Prerequisites

In order for all of this to work, you need to have the following installed:

- [ZSH](https://www.zsh.org/)
- [A nerd font](https://www.nerdfonts.com/)
  - Without this, no icons will show up in your terminal
  - I am using `Fira Code Nerd Font`

## 🚀 Setup

1. Clone this repository to your home directory

```bash
cd ~
git clone git@github.com:afroborg/.dotfiles.git
```

2. `cd` into the cloned repo

```bash
cd .dotfiles
```

3. Update the permissions for the initialization script

```bash
chmod +x initialize.sh
```

4. Run the script

```bash
./initiaze.sh
```

If you are prompted for a password, fill it in.

## 💻 Software

Running the `setup` script above will install the following software

- Homebrew
  - All taps and casks found in [Brewfile](./Brewfile)
- [Oh my zsh](https://ohmyz.sh/)
- [Starship](https://starship.rs/)
