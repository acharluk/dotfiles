current_date=$(date +"%F_%H-%M-%S")
backup_folder=~/.acharluk/backups/$current_date

echo "Creating home directories"
mkdir -p ~/testing ~/downloads ~/repos/$USER ~/documents ~/music ~/pictures/screenshots ~/videos

sudo sh installpackages.sh

cp -r .acharluk ~
~/.acharluk/scripts/acl.update
