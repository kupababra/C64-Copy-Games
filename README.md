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
Utwórz `copy_d64.sh`:
```bash
#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Użycie: $0 ścieżka/do/gry.d64"
    exit 1
fi
D64_FILE="$1"
if [ ! -f "$D64_FILE" ]; then
    echo "Plik $D64_FILE nie istnieje!"
    exit 1
fi
DEVICE=8
echo "Kopiowanie $D64_FILE na stację 1541 II (device $DEVICE)..."
diskcopy -$DEVICE "$D64_FILE"
if [ $? -eq 0 ]; then
    echo "Kopiowanie zakończone pomyślnie!"
else
    echo "Wystąpił błąd podczas kopiowania."
fi
```
Nadaj uprawnienia:
```bash
chmod +x copy_d64.sh
```

### Wgrywanie gry
```bash
./copy_d64.sh /ścieżka/do/gry.d64
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
Create `copy_d64.sh`:
```bash
#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 path/to/game.d64"
    exit 1
fi
D64_FILE="$1"
if [ ! -f "$D64_FILE" ]; then
    echo "$D64_FILE not found!"
    exit 1
fi
DEVICE=8
echo "Copying $D64_FILE to 1541 II (device $DEVICE)..."
diskcopy -$DEVICE "$D64_FILE"
if [ $? -eq 0 ]; then
    echo "Copy completed successfully!"
else
    echo "Error during copying."
fi
```
Make it executable:
```bash
chmod +x copy_d64.sh
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
- [XUM1541 Project](https://www.busware.de/xum1541/)

## 📝 License
MIT License

