from lettuce import world
from random import choice
import datetime

def SaladException(Exception):
    take_screenshot()


def take_screenshot():
    time = _get_current_timestamp()
    random_suffix = _get_random_string(4)
    picname = time + '_' + random_suffix
    world.browser.driver.save_screenshot(picname)


def _get_current_timestamp():
    return datetime.datetime.strftime(datetime.datetime.now(),
                                      '%d-%m-%Y_%H:%M:%S')

def _get_random_string(length):
    lst = [choice(ascii_letters) for n in xrange(length)]
    return "".join(lst)
