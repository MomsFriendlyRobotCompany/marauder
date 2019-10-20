![](pics/header.jpg)

# Marauder

Simple SLAM robot using the iRobot Create 2

## Software

- [pycreate2](https://github.com/MomsFriendlyRobotCompany/pycreate2)
    - `pip install -U pycreate2`
- [ydlidar](https://github.com/MomsFriendlyRobotCompany/ydlidar)
    - `git clone repo`
    - `make install`
- [pygecko python](https://github.com/gecko-robotics/pygecko)
    - `pip install -U pygecko`
- [gecko C++](https://github.com/gecko-robotics/gecko)
    - `git clone repo`
    - `make install`
- [simple slam python](https://github.com/MomsFriendlyRobotCompany/sslam)
    - `pip install -U sslam`
- [ins]()
    - TBD

## Run

1. `gecko.py core run`
1. `/opt/gecko/modules/ydlidar/bin/gecko-ydlidar-node`
    1. Serial port: `/dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0`
1. run ins
1. `robot.py`
    1. Serial port: `/dev/serial/by-id/...`

# API

```
sensors {
    bumps_wheeldrops: int 0-15 (bit packed)
    cliff: [4] int 0-4095 (left, front left, front right, right)
    bumper: [6] int 0-4095 (left, front left, center left, center right, front right, right)
    encoder: [2] int -322768-32767 (left, right)
}

battery {
    charge: int 0-65535
    capacity: int 0-65535
    voltage: int 0-65535 mV
    current: int -322768-32767 mA
}

command {
    speed: int -500-500 mm/sec

}
```

# MIT License

**Copyright (c) 2019 Kevin J. Walchko**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
