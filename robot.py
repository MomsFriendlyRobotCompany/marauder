from  pycreate2 import Create2
import time
from pygecko.multiprocessing import geckopy
from pygecko.packets import Sensors



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
        msg = sensors  # subset?
        p.publish(msg)  # topic msg

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
