#!/bin/bash

read -p "do you want to debloat your system? (y/n): " answer

# Convert input to lowercase to accept Y/y or N/n
answer=${answer,,}

if [[ "$answer" == "y" ]]; then
    echo "debloat starting! 😎"
    #!/bin/bash
# Remove only non-critical, extra apps in Linux Mint
# Safe: keeps all Mint core apps and system tools intact

# List of safely removable apps
apps=(
    "gnome-calculator"
    "thunderbird"
    "rhythmbox"
    "totem"
    "simple-scan"
    "hexchat"
    "pidgin"
    "transmission-gtk"
    "cheese"
    "gimp"
    "brasero"
    "cups-pdf"
    "gnome-logs"
    "gnome-sudoku"
    "gnome-mines"
    "aisleriot"
    "element-desktop"   # Matrix client
)

echo "Starting safe removal of extra apps..."

for app in "${apps[@]}"; do
    if dpkg -l | grep -q "^ii  $app"; then
        echo "Removing $app..."
        sudo apt remove --purge -y "$app"
    else
        echo "$app is not installed, skipping..."
    fi
done

# Clean up leftover packages and caches
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "Done. Only non-critical apps removed."

elif [[ "$answer" == "n" ]]; then
    exit
else
    echo "Invalid input. Please type y or n."
fi

