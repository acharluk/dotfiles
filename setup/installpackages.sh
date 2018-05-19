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

echo "Installing all packages"
pacman -S --needed --force $(cat packagelist) --noconfirm
pacman -S --needed --force $(cat packagelist.optional) --noconfirm
pacman -S --needed --force $(cat packagelist.wifi) --noconfirm