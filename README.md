# hbcli
Holy Bible Command Line Interface

hbcli is a bible in command-line written in ```bash 3.2+```.

hbcli can manager many languages of the bible including greek, Latin, English,
Portuguese, and many others


## Usage
```
hbcli - Holy Bible Command Line

LANGUAGES: <default = english>
-L              List Languages
-i  <language>  Select a language

BIBLE:
-r  <book>     Read a book
-v  <versicle> Select a Versicle
-l         List books
```

## Installation

- Download the latest release.
  - [https://github.com/joao-vitor-sr/hbcli](https://github.com/joao-vitor-sr/hbcli)
- Run make install inside the script directory to install the script.
  - macOS: make PREFIX=/usr/local install
  - Haiku: make PREFIX=/boot/home/config/non-packaged install
  - OpenIndiana: gmake install
  - MinGW/MSys: make -i install
  - NOTE: You may have to run this as root.

