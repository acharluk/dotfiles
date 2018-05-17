current_date=$(date +"%F_%H-%M-%S")
backup_folder=~/.acharluk/backups/$current_date

echo "Creating home directories"
mkdir -p ~/testing ~/downloads ~/repos ~/documents ~/music ~/pictures ~/videos

echo "Copying .acharluk directory"
cp -rf .acharluk ~/.acharluk

echo "Creating backup folder: $backup_folder"
mkdir -p $backup_folder

echo "Backing up original configuration..."
if [ -f ~/.bashrc ]; then
    echo "Moving .bashrc to .bashrc.backup_$current_date"
    mv ~/.bashrc $backup_folder/.bashrc
fi
if [ -f ~/.bash_profile ]; then
    echo "Moving .bash_profile to .bash_profile.backup_$current_date"
    mv ~/.bash_profile $backup_folder/.bash_profile
fi
if [ -f ~/.bash_aliases ]; then
    echo "Moving .bash_aliases to .bash_aliases.backup_$current_date"
    mv ~/.bash_aliases $backup_folder/.bash_aliases
fi
if [ -f ~/.vimrc ]; then
    echo "Moving .vimrc to .vimrc.backup_$current_date"
    mv ~/.vimrc $backup_folder/.vimrc
fi


if grep -q archlinux.fr "/etc/pacman.conf"; then
    echo "archlinuxfr is already setup!";
else
    echo "Adding archlinux.fr server to pacman configuration"
    echo " " >> /etc/pacman.conf
    echo "[archlinuxfr]" >> /etc/pacman.conf
    echo "SigLevel = Never" >> /etc/pacman.conf
    echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf
fi

echo "Updating pacman and installing yaourt"
pacman -Sy yaourt --noconfirm

# Install packages
echo "Installing packagelist"
pacman -S $(cat packagelist)
echo "Installing packagelist.optional"
pacman -S $(cat packagelist.optional)
echo "Installing packagelist.wifi"
pacman -S $(cat packagelist.wifi)

echo "Adding bash aliases"
cp .bash_aliases ~/.bash_aliases
echo "Adding bashrc"
cp .bashrc ~/.bashrc
echo "Adding bash profile"
cp .bash_profile ~/.bash_profile
echo "Adding vimrc"
cp .vimrc ~/.vimrc