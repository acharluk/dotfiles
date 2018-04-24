# Yaourt
echo " " >> /etc/pacman.conf
echo "[archlinuxfr]" >> /etc/pacman.conf
echo "SigLevel = Never" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf

# Update pacman and install yaourt
pacman -Sy yaourt --noconfirm

# Install packages
pacman -S $(cat packagelist)
pacman -S $(cat packagelist.optional)
