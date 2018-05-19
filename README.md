# dotfiles
## How to install my configuration
Run this command: `git clone https://github.com/acharluk/dotfiles.git && cd dotfiles/setup && sh setup.sh`

It will install all packages in `packagelist`, `packagelist.optional` and `packagelist.wifi` and apply all my configuration to your system!

## Scripts
- acl.update: Downloads the latest configuration from GitHub, backups the current one and applies the new one.
- acl.backup: Backups the current configuration
- acl.restore: Restores the latest backed up configuration, saved in ~/.acharluk/backups/last