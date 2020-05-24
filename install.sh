# install some important software
sudo pacman -S zsh neovim ranger
# install other software
# AUR
sudo pacman -S yaourt yay
# others
sudo pacman -S python-pip ccls bat fzf w3m lazygit picom dmenu neofetch htop
# fcitx
sudo pacman fcitx fcitx-im fcitx-configtool fcitx-googlepinyin
# .....and some other software which doesn't list here.

############### install my font ##################
# install chinese font
sudo pacman -S wqy-zenhei ttf-fireflysung 
# install hack nerd font mono
mkdir ~/.local/share/fonts
#curl "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf" -o ~/.local/share/fonts/Hack Regular Nerd Font Complete Mono.ttf
#fc-cache -fv

################## For my zsh ##########################
# install oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# download my zshrc
rm -f ~/.zshrc
cp ~/Github/.config/zsh/.zshrc-copy ~/.zshrc
cp -r ~/Github/.config/zsh ~/.config/zsh
# install some zsh plugins
# oh-my-zsh-powerline-theme
git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git ~/Github/oh-my-zsh-powerline-theme
sudo sh ~/Github/oh-my-zsh-powerline-theme/install_in_omz.sh
# zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

################ vimrc ######################
rm -rf ~/.config/nvim
cp -r ~/Github/.config/nvim ~/.config/nvim

################ ranger #####################
rm -rf ~/.config/ranger
cp -r ~/Github/.confit/ranger ~/.config/ranger

############### neofetch ####################
rm -rf ~/.config/neofetch
cp ~/Github/.config/neofetch ~/.config/neofetch

############### alacritty ################
rm -rf ~/.config/alacritty
cp -r ~/Github/.config/alacritty ~/.config/alacritty

############### picom ####################### 
cp ~/Github/.config/picom.conf ~/.config/picom.conf

################# st ########################
git clone https://github.com/sheriby/st.git ~/Github/st

################# dwm #######################
git clone https://github.com/sheriby/dwm.git ~/Github/dwm
mkdir ~/scripts
touch ~/scripts/autostart.sh

################## and so on ######################
yay -S libxft-bgra # solve the problem of emoji in simple termainal
sudo pacman -S noto-font-emoji
