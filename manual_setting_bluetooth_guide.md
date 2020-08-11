# Instructions on how to set Bluetooth Server, pairing and connection.
## Pairing Devices

Warning: You just need to do this once for each new device connected. It works with only one device at a time.

Since it's easier to interact with the Pi, we will perform an Outbound Pairing, as described on:

```https://core.docs.ubuntu.com/en/stacks/bluetooth/bluez/docs/reference/pairing/outbound```

You can just follow those steps and you the devices will be paired, but notice they are still not connected.

## Enable SSP Profile on Raspberry Pi

- 1. Open Bluetooth service configuration file.

```sudo nano /etc/systemd/system/dbus-org.bluez.service```

- 2.Look for a line starts with “ExecStart” and add compatibility flag ‘-C’ at the end of the line.

```ExecStart=/usr/lib/bluetooth/bluetoothd -C```

- 3. Add a line below immediately after “ExecStart” line, then save and close the file.

```ExecStartPost=/usr/bin/sdptool add SP```

## Connection

### Automatic Binding
it happens when your ESP 32 starts the connection procedure.
    - Listen for incoming connection on Raspberry Pi.

        ```sudo rfcomm watch hci0```
### Manual Binding

You will need to create the virtual port and add the device to it since it's not created automatically.

We need to creat the rfcomm socket that is not created automatically. simply run the commands above:

- Make sure you're at root:
    
  ```cd```

- Use your ESP 32 device's MAC adress on "<device>":

  ```sudo rfcomm bind rfcomm0 <device> add```
- 1. Pairing:

Warning: You just need to do this once for each new device connected. It works with only one device at a time.

Since it's easier to interact with the Pi, we will perform an Outbound Pairing, as described on:

```https://core.docs.ubuntu.com/en/stacks/bluetooth/bluez/docs/reference/pairing/outbound```

You can just follow those steps and you the devices will be paired, but notice they are still not connected.

- 2. Binding:

  - Automatic Binding: it happens when your ESP 32 starts the connection procedure.
    - Listen for incoming connection on Raspberry Pi.

        ```sudo rfcomm watch hci0```
        
  - Manual Binding: You will need to create the virtual port and add the device to it since it's not created automatically.

    We need to creat the rfcomm socket that is not created automatically. simply run the commands above:

    - Make sure you're at root:
    
      ```cd```

    - Use your ESP 32 device's MAC adress on "<device>":

      ```sudo rfcomm bind rfcomm0 <device> add```
