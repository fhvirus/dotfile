# Things to do after an reinstall

Installing Kubuntu 22.04.3

- touchpad
	- scroll direction
	- two finger for right click
- font
	- Hack nerd font
	- 14 pt
- shortcut
	- map capslock to esc

- (no need) amdgpu firmware: https://www.amd.com/en/support/linux-drivers
- vim-gtk texlive-full curl wget git bat tree ncdu xclip ripgrep fd-find silversearcher-ag clang-format ca-certificates gnupg openvpn zbar-tools libsixel-bin ffmpeg
- libime cmake gcc g++ gettext libimetable-dev libboost-all-dev libimecore-dev extra-cmake-modules build-essential
- fcitx5 fcitx5-table-extra fcitx5 fcitx5-chewing fcitx5-rime fcitx5-chinese-addons fcitx5-config-qt fcitx5-mozc kde-config-fcitx5 libfcitx5utils-dev libfcitx5core-dev
- [fcitx5 table extra](https://github.com/fcitx/fcitx5-table-extra):
	- fcitx's prefix is `/usr`
	- put these in `/etc/environment`
```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```
  - `cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart/fcitx5.desktop` for autostart.

- reinstall firefox
	- download from official site
	- `sudo tar xvjf firefox-*.tar.bz2 -C /opt`
	- create `~/.local/share/applications/firefox.desktop`:
```
[Desktop Entry]
Version=1.0
Type=Application
Exec=/opt/firefox/firefox
Terminal=false
Name=Firefox
GenericName=Firefox Browser
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network
```
- zsh
	- install with apt and `sudo chsh -s $(which zsh)`
	- logout & login
	- oh my zsh: sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
- [fzf](https://github.com/junegunn/fzf)
- put [this](https://raw.githubusercontent.com/nordtheme/konsole/develop/src/nord.colorscheme) into `.local/share/konsole/nord.colorscheme` and configure profile.
- install rofi with apt & configure custom shortcut
- tldr
- tmux, [tpm](https://github.com/tmux-plugins/tpm)

- ssh
	- `ssh-keygen -t rsa`
	- update sshkeys everywhere (ex. github)
- vim-plug
- zathura
    - xdotool
- neovim
    - [bob](https://github.com/MordechaiHadad/bob)
    - `bob use stable`

- dotfiles
	- Simply merge them one by one

- fonts
	- [max's fonts](https://github.com/max32002)
	- [But Ko's fonts](https://github.com/ButTaiwan)
	- Justfont fonts
  - https://data.gov.tw/dataset/5961
  - firefox disable website fonts
- konsole
  - window rules
- shortcut
  - Meta+HJKL
  - Meta+Z
- Wallpaper, sddm, user avatar

- python3
  - python3-pip
- openjdk-19-jdk openjdk-19-jre

- libre office
- [tps](https://github.com/ioi-2017/tps)
    - apt install dos2unix
- [gdb-pwndbg](https://github.com/pwndbg/pwndbg)
    - clone into `/usr/local/src` and `chown` it.
- [rust](https://doc.rust-lang.org/book/ch01-01-installation.html)
- `sudo wget https://raw.githubusercontent.com/ifsmirnov/jngen/master/jngen.h -O /usr/local/include/jngen.h`
- Comment out `/etc/apt/apt.conf.d/20apt-esm-hook.conf`
- musescore
- https://www.haskell.org/ghcup/
- wezterm
