# Check if it is run as sudo
if [[ $EUID -ne 0 ]]; then
    printf "\033[31mThe Script must be run as sudo\033[0m"
    exit 1
fi

directory=$(pwd)

echo -e "#This File is for having the RefinedArchDevelopment Repository in an mirrorlist customized for your user. \n# It is used for building the ISO \n Server = file://$directory/Repository/x86_64" >/etc/pacman.d/RefinedArchDevelopment
