current_date=$(date +"%F_%H-%M-%S")
backup_folder=~/.acharluk/backups/$current_date

echo "Creating home directories"
mkdir -p ~/testing ~/downloads ~/repos ~/documents ~/music ~/pictures ~/videos

sudo sh installpackages.sh

cp -r .acharluk ~
~/.acharluk/scripts/acl.update
