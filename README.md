# Radar Visualization Using Processing

This project visualizes radar data using the Processing environment. It reads data from a serial port and displays it on a radar-like interface.

## Features

- **Radar Display**: Visual representation of distances and angles.
- **Dynamic Data**: Updates in real-time based on serial data input.
- **Object Detection**: Highlights detected objects on the radar.

## Prerequisites

- Processing IDE: [Download Processing](https://processing.org/download/)
- Arduino or similar microcontroller sending data via serial.
- Breadboard for wiring connections.
- Jumper wires

## Hardware Setup

### Components

- **Ultrasonic Sensor** (HC-SR04)
- **Servo Motor**
- **Arduino** (e.g., Arduino Uno)
- **Breadboard**
- **Jumper Wires**

### Wiring Instructions

1. **Power Connections**:
   - **Arduino to Breadboard**:
     - Connect the **5V** pin of the Arduino to the positive rail on the breadboard.
     - Connect the **GND** pin of the Arduino to the negative rail on the breadboard.

2. **Servo Motor Connections**:
   - **Control Pin**: Connect the **yellow** jumper wire from the servo motor’s control pin to Arduino digital pin **12**.
   - **Power**: 
     - Connect the **red** wire from the servo motor to the positive rail on the breadboard (where Arduino 5V is connected).
     - Connect the **black** wire from the servo motor to the negative rail on the breadboard (where Arduino GND is connected).

3. **Ultrasonic Sensor Connections**:
   - **Trig Pin**: Connect the **yellow** jumper wire from the ultrasonic sensor’s Trig pin to Arduino digital pin **10**.
   - **Echo Pin**: Connect the **yellow** jumper wire from the ultrasonic sensor’s Echo pin to Arduino digital pin **11**.
   - **Power**:
     - Connect the **red** wire from the ultrasonic sensor to the positive rail on the breadboard (where Arduino 5V is connected).
     - Connect the **black** wire from the ultrasonic sensor to the negative rail on the breadboard (where Arduino GND is connected).

## Arduino Code

Ensure you have the Arduino code running on your device to send angle and distance data over serial. The Processing code expects data in the format `angle, distance.`

## Processing Code

1. **Install Processing IDE**:
   Download and install the Processing IDE from [Processing.org](https://processing.org/download/).

2. **Connect Your Device**:
   Ensure your Arduino or other microcontroller is connected to your computer and is sending data via the specified serial port.

3. **Update Serial Port**:
   Modify the `setup()` function in the Processing sketch to match your device’s serial port. Replace `"COM7"` with your port identifier (e.g., `"COM3"` on Windows or `"/dev/ttyUSB0"` on Linux/Mac).

## Running the Code

1. **Open Processing IDE**:
   Launch the Processing IDE.

2. **Load the Sketch**:
   Copy the provided Processing code into a new sketch in the Processing IDE.

3. **Run the Sketch**:
   Click the "Run" button in the Processing IDE to start visualizing the data.

4. **View Output**:
   The radar visualization will display on the screen, showing distance and angle data in real-time.


## Troubleshooting

- **No Data Displayed**:
  - Check if the serial port in the `setup()` function matches your device's port.
  - Ensure the device is properly connected and sending data.

- **Inaccurate Data**:
  - Verify that the Arduino code is correctly sending formatted data.
  - Ensure the data is in the format `angle, distance.`.


## Contact

If you have any questions or feedback, please don't hesitate to contact me.
