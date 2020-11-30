import pygame

class Event:

    def __init__(self, type, **kargs):

        # du meme type que les type pygame
        self.type = type
        self.kargs = kargs
        self.run = None

    def getFunction(self):
        return self.run



class Key(Event):
    """
    class that represent a keyboard event. It need to be 
    """
    def __init__(self, key, down = True, function):
        super().__init__((self, pygame.KEYDOWN if down else pygame.KEYUP), kargs= {"key": key})

        self.run = function
