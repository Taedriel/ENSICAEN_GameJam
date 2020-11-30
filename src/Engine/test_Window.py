import sys
from .Window import Window

screen = Window()
screen.__start__()

assert screen.w["status"] == True