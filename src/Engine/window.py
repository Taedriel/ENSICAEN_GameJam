# Class to manage the windows of the app

import pygame
import sys

class Window:
    """
    Singleton that represent a window.
    You could add component to the window
    Tou could add event to the window
    You could remove add to the window
    You could remove event to the window

    All of this is accessible through the object w
    """
    w = {}

    def __init__(self, sizeW=(300, 300)):

        if "status" not in Window.w.keys():
            # First time, we create the windows
            
            pygame.init()
            Window.w["status"] = True
            Window.w["screen"] = pygame.display.set_mode(sizeW)
            Window.w["ingame"] = False
            Window.w["components"] = []
            Window.w["events"] = []

        else:
            # other time, it's just to get a reference of the actual window
            pass

    @staticmethod
    def addComponent(comp):
        Window.w["components"].add(comp)

    @staticmethod
    def removeComponent(comp):
        if comp in Window.w["components"]:
            Window.w["components"].remove(comp)
        else:
            raise AttributeError(comp.__str__())

    @staticmethod
    def addEventHandler(event):
        Window.w["events"] = event

    @staticmethod
    def removeEventHandler(event):
        if event in Window.w["event"]:
            Window.w["components"].remove(event)
        else:
            raise AttributeError(event.__str__())

    @staticmethod
    def __start__():

        Window.w["ingame"] = True
        while Window.w["ingame"]:

            #           Event 
            for event in pygame.event.get():

                if event.type == pygame.QUIT:
                    Window.w["ingame"] = False
                    pygame.quit()

                if event.type == pygame.KEYDOWN:
                    if event.unicode in Window.w["events"]["KEYDOWN"][0]:
                        Window.w["events"]["KEYDOWN"].getFunction()

            #           Refresh
            for elem in Window.w["components"]:
                elem.draw(Window.w["screen"])



            # at the end of all event, refresh the screen. If you want to refresh earlier
            # call this instruction
            if Window.w["ingame"]:
                pygame.display.flip()

        Window.w["ingame"] = False

