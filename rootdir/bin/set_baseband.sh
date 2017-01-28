#!/system/bin/sh

# grep the modem partition for baseband version and set it
if strings /firmware/image/modem.b21 | grep "^M8974A-"; then
    # "d800" | "d801" | "d802" | "d803" | "f320" | "l01f"
    setprop gsm.version.baseband `strings /firmware/image/modem.b21 | grep "^M8974A-" | head -1`
elif strings /firmware/image/modem.b18 | grep "^MPSS.DI"; then
    # "ls980" | "vs980"
    setprop gsm.version.baseband `strings /firmware/image/modem.b18 | grep "^MPSS.DI" | head -1`
fi
