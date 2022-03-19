flatpak install org.kde.krfb -y

# We need to give krfb access to the network, or else the service will not be available
sudo flatpak override org.kde.krfb --share=network
