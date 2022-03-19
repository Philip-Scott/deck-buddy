<p align="center">
  <img src="data/icons/128.svg" alt="Icon" />
</p>
<h1 align="center">Deck Buddy</h1>
<h2 align="center">Automatic installation and configuration of Steam Deck utilities</h2>

## Utilities

- Remote Desktop Setup

## Developing and Building

If you want to hack on and build the Deck-Buddy app yourself, you'll need the following dependencies:

* libgee-0.8-dev
* libgtk-3-dev
* meson
* valac

Run `meson build` to configure the build environment 

    meson build --prefix=/usr
    cd build

To install, use `ninja install`, then execute with `com.github.philip_scott.deck_buddy`

    sudo ninja install
    com.github.philip_scott.deck_buddy
