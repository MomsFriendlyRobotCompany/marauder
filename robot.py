from  pycreate2 import Create2
import time
from pygecko.multiprocessing import geckopy
from pygecko.packets import Sensors

class create_st(namedtuple('create_st', 'bumps_wheeldrops cliff bumper encoder timestamp')):
    """
    Create2 key sensors
    """
    __slots__ = ()

    def __new__(cls, bw, c, b, e, ts=None):
        # cls.id = GeckoMsgFlags.create
        cls.id = 100
        if ts:
            return cls.__bases__[0].__new__(cls, bw, c, b, e, ts)
        else:
            return cls.__bases__[0].__new__(cls, bw, c, b, e, time.time())

class battery_st(namedtuple('battery_st', 'charge capacity voltage current timestamp')):
    """
    Create2 battery
    """
    __slots__ = ()

    def __new__(cls, c, w, v, a, ts=None):
        # cls.id = GeckoMsgFlags.create
        cls.id = 101
        if ts:
            return cls.__bases__[0].__new__(cls, c, w, v, a, ts)
        else:
            return cls.__bases__[0].__new__(cls, c, w, v, a, time.time())

class Marauder(object):
    def __init__(self, port, key):
        geckopy.init_node()
        self.pub = geckopy.pubBinderTCP(key, 'create')
        self.sub = geckopy.subConnectTCP(key, 'cmd')

        # Create a Create2
        self.bot = Create2(port)
        self.bot.start()

    def publisher(self):
        sensors = bot.get_sensors()  # returns all data
        msg = create_st(
            sensors.bumps_wheeldrops,
            [
                sensors.cliff_left_signal,
                sensors.cliff_front_left_signal,
                sensors.cliff_front_right_signal,
                sensors.cliff_right_signal
            ],
            [
                sensors.light_bumper_left,
                sensors.light_bumper_front_left,
                sensors.light_bumper_center_left,
                sensors.light_bumper_center_right,
                sensors.light_bumper_front_right,
                sensors.light_bumper_right
            ],
            [
                sensors.encoder_counts_left,
                sensors.encoder_counts_right
            ]
        )
        p.publish(msg)  # topic msg

        msg = battery_st(
            sensors.charge,
            sensors.capacity,
            sensors.voltage,
            sensors.current
        )

    def subscriber(self):
        msg = s.recv_nb()
        if msg:
            geckopy.loginfo("{}: {}".format(topic,msg))

    def loop(self):
        if self.pub is None: raise Exception("publisher is None")
        if self.sub is None: raise Exception("subscriber is None")

        rate = geckopy.Rate(10)

        while not geckoopy.is_shutdown():
            self.publisher()
            self.subscriber()
            rate.sleep()


if __name__ == "__main__":
    bot = Marauder('/dev/ttyUSB0', 'local')

    while True:
    try:
        bot.run()
    except KeyboardInterrupt:
        print('main process got ctrl-c')
        break
