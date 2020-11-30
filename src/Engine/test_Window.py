import sys
from .window import Window


def test_start_Screen():
    screen = Window()
    screen.__start__()

    assert screen.w["status"] == False

def test_add_component():

    pass

def test_remove_component():

    pass

def test_add_event():

    pass

def test_remove_event():

    pass