GPS MOOS-Driver (iGPS)
================

This is a simple driver for a serial GPS module.
It is provided as an example and a starting point for [MOOS-Drivers](https://github.com/MOOS-drivers) developers.

## Usage:
```bash
iGPS config.moos
```

The configuration file must contain:
```C++
ProcessConfig = iGPS
{
   AppTick   	= 4
   CommsTick 	= 4

   PORT  		= /dev/ttyUSB0 // serial port number where the GPS is plugged in
   BAUDRATE 	= 4800 // the baudrate to use
   MAX_RETRIES 	= 5 // max retries before failure
   PUBLISHRAW 	= true // plushing raw data from the GPS

   // Coordinates of the origin required for MOOS-geodesy
   LatOrigin    = 44.095738
   LongOrigin   = 9.865190
}
```
An example is provided in the `src` folder.

## Installation:
### Download the source:
First clone the repository locally:
```bash
git clone https://github.com/MOOS-Drivers/iGPS
```
### Compile it:
Then change to the recently created directory:
```bash
cd iGPS
```
And launch the build script:
```bash
./build.sh
```
### Install it:
You can now either install it permanently on your system:
```bash
sudo make install
```
Or add the recently generated binary folder to your path:
```bash
export PATH=$PATH:$PWD/bin
```
### Test it:
A test script is provided in `bin/launch_test_iGPS.sh`.

## Dependencies
Please make sure that [moos-ivp](http://moos-ivp.org) is already compiled and installed.

A `cmake` is also required.

# Structure of the project
```
├── bin 
│   ├── clean_test_iGPS.sh
│   ├── launch_test_iGPS.sh
│   └── meta_test.moos
├── build.sh 
├── CMakeLists.txt
├── LICENSE
├── README.md
└── src 
    ├── CMakeLists.txt
    ├── GPS.cpp
    ├── GPS.h
    ├── GPS_Info.cpp
    ├── GPS_Info.h
    ├── iGPS.moos
    └── main.cpp
```

The `bin` folder contains the tests scripts (and the binaries).

The `src` folder contains the source of the project.