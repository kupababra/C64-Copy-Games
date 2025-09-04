# Kopiowanie gier `.d64` na Commodore 1541 II przy użyciu XUM1541 i OpenCBM (PL / EN)

---

## 🇵🇱 Wersja polska

### Wymagania
- Komputer z Linux (dla Windows użyj WSL)
- Adapter XUM1541 (USB → IEC)
- Stacja dyskietek Commodore 1541 II
- Kabel IEC
- Plik `.d64` z grą
- Git, gcc, make

### Instalacja OpenCBM z Git
```bash
git clone https://github.com/OpenCBM/opencbm.git
cd opencbm
make -f LINUX/Makefile opencbm plugin-xum1541
sudo make install
lsusb
```

### Podłączenie sprzętu
```
[Komputer] --USB--> [XUM1541] --IEC--> [C64 1541 II]
```
- Włącz stację i ustaw numer ID np. 8.

### Skrypt Bash do kopiowania `.d64`
Utwórz `write_game.sh`:
```bash
#!/bin/bash
if [ -z "$1" ]; then
  echo "Użycie: $0 nazwa_gry.d64"
  echo "Usage: $0 game_name.d64"
  exit 1
fi

if ! command -v d64copy &> /dev/null
then
    echo "d64copy nie jest zainstalowane! / is not installed!"
    exit 1
fi

echo "Rozpoczynam kopiowanie / Starting copy: $1"
d64copy "$1"
echo "Kopiowanie zakończone / Copy finished!"
```
Nadaj uprawnienia:
```bash
chmod +x write_game.sh
```

### Wgrywanie gry
```bash
./write_game.sh /examples/example.d64
```
Na C64:
```basic
LOAD "*",8,1
RUN
```

---

## 🇬🇧 English Version

### Requirements
- Linux computer (Windows: use WSL)
- XUM1541 adapter (USB → IEC)
- Commodore 1541 II disk drive
- IEC cable
- Game `.d64` file
- Git, gcc, make

### Install OpenCBM from Git
```bash
git clone https://github.com/OpenCBM/opencbm.git
cd opencbm
make -f LINUX/Makefile opencbm plugin-xum1541
sudo make install
lsusb
```

### Hardware Connection
```
[Computer] --USB--> [XUM1541] --IEC--> [C64 1541 II]
```
- Power on the drive and set device ID e.g., 8.

### Bash Script for Copying `.d64`
Create `write_game.sh`:
```bash
#!/bin/bash
if [ -z "$1" ]; then
  echo "Użycie: $0 nazwa_gry.d64"
  echo "Usage: $0 game_name.d64"
  exit 1
fi

if ! command -v d64copy &> /dev/null
then
    echo "d64copy nie jest zainstalowane! / is not installed!"
    exit 1
fi

echo "Rozpoczynam kopiowanie / Starting copy: $1"
d64copy "$1"
echo "Kopiowanie zakończone / Copy finished!"
```
Make it executable:
```bash
chmod +x write_game.sh
```

### Loading the Game
```bash
./copy_d64.sh /path/to/game.d64
```
On C64:
```basic
LOAD "*",8,1
RUN
```

---

## 🔗 Useful Links
- [OpenCBM GitHub](https://github.com/OpenCBM/opencbm)

## 📝 License
MIT License

