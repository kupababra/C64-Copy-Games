# 🎮 Kopiowanie gier na Commodore 64 z Linuxa / Copying Games to C64 from Linux

![License](https://img.shields.io/github/license/yourusername/C64-Copy-Games)
![Platform](https://img.shields.io/badge/platform-Linux-blue)
![C64](https://img.shields.io/badge/retro-Commodore%2064-orange)

Poradnik w dwóch językach:
- 🇵🇱 [Polski](#-kopiowanie-gier-na-commodore-64-z-linuxa-przy-użyciu-xum1541-i-d64copy)
- 🇬🇧 [English](#-copying-games-to-commodore-64-from-linux-using-xum1541-and-d64copy)

---

## 📑 Spis treści
- [🇵🇱 Instrukcja po polsku](#-kopiowanie-gier-na-commodore-64-z-linuxa-przy-użyciu-xum1541-i-d64copy)
  - [1. Wymagania sprzętowe](#1-wymagania-sprzętowe)
  - [2. Wymagania programowe](#2-wymagania-programowe-linux)
  - [3. Sprawdzenie połączenia](#3-sprawdzenie-połączenia)
  - [4. Przygotowanie obrazu gry](#4-przygotowanie-obrazu-gry)
  - [5. Wgrywanie gry na dyskietkę](#5-wgrywanie-gry-na-dyskietkę)
  - [6. Skrypt automatyzujący](#6-skrypt-automatyzujący-write_gamesh)
  - [7. Przykłady](#7-folder-examples)
- [🇬🇧 English Guide](#-copying-games-to-commodore-64-from-linux-using-xum1541-and-d64copy)
  - [1. Hardware Requirements](#1-hardware-requirements)
  - [2. Software Requirements](#2-software-requirements-linux)
  - [3. Checking the Connection](#3-checking-the-connection)
  - [4. Preparing the Game Image](#4-preparing-the-game-image)
  - [5. Writing the Game to a Floppy](#5-writing-the-game-to-a-floppy)
  - [6. Automation Script](#6-automation-script-write_gamesh)
  - [7. Examples](#7-examples-folder)

---

## 🇵🇱 Kopiowanie gier na Commodore 64 z Linuxa przy użyciu XUM1541 i d64copy

### 1. Wymagania sprzętowe
- 💻 Linux  
- 🎮 Commodore 64  
- 💾 Stacja dyskietek **1541-II**  
- 🔌 Interfejs **XUM1541**  
- 📀 Puste dyskietki **5,25"**  
- 🔗 Kabel USB  

### 2. Wymagania programowe (Linux)
**Debian / Ubuntu**
```bash
sudo apt update
sudo apt install opencbm vice d64copy
```

**Arch Linux / Manjaro**
```bash
sudo pacman -Syu opencbm vice d64copy
```

**Fedora**
```bash
sudo dnf install opencbm vice d64copy
```

ℹ️ Jeśli Linux nie wykrywa urządzenia USB, dodaj użytkownika do grupy `dialout`:
```bash
sudo usermod -a -G dialout $USER
```
Wyloguj się i zaloguj ponownie.

### 3. Sprawdzenie połączenia
```bash
lsusb          # powinno pojawić się: VIC-20 / C64 IEC Interface
cbmctrl detect # wykrywa stację
```

### 4. Przygotowanie obrazu gry
```bash
# Jeśli masz plik w formacie .g64, skonwertuj go:
c1541 game.g64 -attach game.d64
```

### 5. Wgrywanie gry na dyskietkę
```bash
./write_game.sh examples/example_game.d64
```

Na C64:
```basic
LOAD"$",8
LIST
```

### 6. Skrypt automatyzujący (`write_game.sh`)
```bash
#!/bin/bash
if [ -z "$1" ]; then
  echo "Użycie: $0 nazwa_gry.d64"
  exit 1
fi

if ! command -v d64copy &> /dev/null
then
    echo "d64copy nie jest zainstalowane! Zainstaluj pakiet d64copy."
    exit 1
fi

echo "Rozpoczynam kopiowanie $1 na dyskietkę..."
d64copy "$1"
echo "Kopiowanie zakończone!"
```

Nadaj prawa do wykonywania:
```bash
chmod +x write_game.sh
```

### 7. Folder `examples`
Umieść przykładowe obrazy `.d64` w katalogu `examples/`.

---

## 🇬🇧 Copying Games to Commodore 64 from Linux using XUM1541 and d64copy

### 1. Hardware Requirements
- 💻 Linux  
- 🎮 Commodore 64  
- 💾 **1541-II** floppy disk drive  
- 🔌 **XUM1541** interface  
- 📀 Blank **5.25"** floppy disks  
- 🔗 USB cable  

### 2. Software Requirements (Linux)
**Debian / Ubuntu**
```bash
sudo apt update
sudo apt install opencbm vice d64copy
```

**Arch Linux / Manjaro**
```bash
sudo pacman -Syu opencbm vice d64copy
```

**Fedora**
```bash
sudo dnf install opencbm vice d64copy
```

ℹ️ If Linux does not detect the USB device, add your user to the `dialout` group:
```bash
sudo usermod -a -G dialout $USER
```
Log out and log back in.

### 3. Checking the Connection
```bash
lsusb          # should show: VIC-20 / C64 IEC Interface
cbmctrl detect # detects the drive
```

### 4. Preparing the Game Image
```bash
# If you have a .g64 file, convert it:
c1541 game.g64 -attach game.d64
```

### 5. Writing the Game to a Floppy
```bash
./write_game.sh examples/example_game.d64
```

On C64:
```basic
LOAD"$",8
LIST
```

### 6. Automation Script (`write_game.sh`)
```bash
#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 game_name.d64"
  exit 1
fi

if ! command -v d64copy &> /dev/null
then
    echo "d64copy is not installed! Please install the d64copy package."
    exit 1
fi

echo "Starting to copy $1 to floppy..."
d64copy "$1"
echo "Copy finished!"
```

Make it executable:
```bash
chmod +x write_game.sh
```

### 7. `examples` Folder
Place sample `.d64` images in the `examples/` directory.

---

## 📷 Screenshots
*(tu możesz dodać zdjęcia XUM1541, C64 i przykładowe zrzuty z terminala)*

---

## 📜 License
This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.
