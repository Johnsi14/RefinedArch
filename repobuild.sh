#Checking if the Repository Folder exists and if not create it
mkdir Repository
printf "\e[32mDon't Worry Everything is working Correctly even if you got an Error message \e[0m"
#This makes the Script stopp on error

set -euo pipefail

cd Pkgbuild/x86_64

package="$(find . -maxdepth 1 -mindepth 1 -type d)"

#Compressing the folder in the calamares-config repo
tar -cf ./calamares-config/calamares-config.tar.gz ./calamares-config/calamares-config

handle_makepkg() {
    if ! output=$(makepkg 2>&1 | tee /dev/stderr); then
        if echo "$output" | grep -q "A package has already been built"; then
            echo -e "\e[32mSkipping this Package $(basename "$(pwd)") \e[0m"
        else
            return 1
        fi
    fi
}

for f in $package; do
    cd "$f"
    handle_makepkg
    cp "$f"-*[0-9]-*[0-9]-*.pkg.tar.zst ../../../Repository/x86_64
    cd ..
done

cd ../../Repository/x86_64

rm -f refined-repo*

repo-add -n -R refined-repo.db.tar.gz *.pkg.tar.zst

# Removing the Symlinks which could cause Trouble according to some Internet Guy
rm refined-repo.db
rm refined-repo.files

mv refined-repo.db.tar.gz refined-repo.db
mv refined-repo.files.tar.gz refined-repo.files

printf "\e[32mAll the Packages are buildt \e[0m"
