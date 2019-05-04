#!/usr/bin/env python3

from nxp_imu import IMU
import time
from the_collector import BagIt
from the_collector import Pickle
from collections import namedtuple


if __name__ == "__main__":
    imu = IMU(gs=4, dps=2000, verbose=True)
    bag = BagIt(Pickle)

    Data = namedtuple('Data', 'a m g timestamp')

    for _ in range(1000):
        a, m, g = imu.get()
        ts = time.time()
        # d = Data(a, m, g, time.time())
        bag.push('accel', (a, ts,))
        bag.push('mag', (m, ts,))
        bag.push('gyro', (g, ts,))

        time.sleep(1/20)

    bag.write('imu-rpi', timestamp=True)
