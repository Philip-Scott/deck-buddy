# Remote Desktop

Tweaking your Steam Deck in desktop mode is much easier with a keyboard and mouse. If you don't happen to have a USB-C dock to plug it in, you can use [Krfb](https://userbase.kde.org/Krfb) to share your desktop with your PC. Note that is is not performant enough to scream gameplay. 

![remote-desktop demo](.screenshots/remote-desktop-demo.png)

## Steam Deck Setup

We are going to install Krfb as a Flatpak, and give it permissions to use the network. 


- Run the `setup.sh` script from this folder. 

Once installed, launch Krfb. This can be easly done from the Application Launcher > Internet > Krfb

![Launching krfb](.screenshots/launching-krfb.png)


If everything was done correctly, you should see an IP Address other than 127.0.0.1 on the Connection Details box as seen bellow: 

![krfb startup](.screenshots/krfb-startup.png)

## Desktop Setup

Install [Krdc](https://userbase.kde.org/Krdc) (or any VCN Client) on the machine you wish to access your Steam Deck from.

Launch the app. Select VCN from the `Connect to` dropdown, and type in `deck@YOUR_IP_ADDRESS:5900`, replacing "YOUR_IP_ADDRESS" with the IP shown on the image above. If you changed the username for desktop mode, replace `deck` with that username. 


![krdc config](.screenshots/krdc-connect.png)

Press the button to the right of this text box, and a dialog will pop up asking for the password. This is the password that is shown on the Connection Details on your Steam Deck. After setting the password, you will need to accept the conection on your Steam Deck. 

![Allow Access](.screenshots/allow-access.png)

And that's it! Enjoy remote access to your Deck! 