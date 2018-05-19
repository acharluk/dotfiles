current_date=$(date +"%F_%H-%M-%S")
backup_folder=~/.acharluk/backups/$current_date

echo "Creating home directories"
mkdir -p ~/testing ~/downloads ~/repos/$USER ~/documents ~/music ~/pictures/screenshots ~/videos

sudo sh installpackages.sh

echo "Installing yaourt packages"
yaourt -S --needed --force  $(cat packagelist.yaourt) --noconfirm

cp -r ../user/.acharluk ~
~/.acharluk/scripts/acl.update

echo "Adding .config directory"
cp -rf ../user/.config ~
echo "Adding .newsboat directory"
cp -rf ../user/.newsboat ~
echo "Adding .xinitrc"
cp ../user/.xinitrc ~
echo "Adding .Xresources"
cp ../user/.Xresources ~
echo "Adding .gtkrc-2.0.mine"
cp ../user/.gtkrc-2.0.mine ~

echo "Adding /etc files"
sudo cp -r ../etc/* /etc