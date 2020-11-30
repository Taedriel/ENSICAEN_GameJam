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
            Window.w["components"] = {
                "KEYDOWN": []
            }
            Window.w["events"] = []

        else:
            # other time, it's just to get a reference of the actual window
            pass

    @staticmethod
    def addComponent():
        pass

    @staticmethod
    def __start__():

        while Window.w["ingame"]:

            for event in pygame.event.get():

                if event.type == pygame.QUIT:
                    pygame.quit()
                    sys.exit(0)

                if event.type == pygame.KEYDOWN:
                    if event.unicode in Window.w["events"]["KEYDOWN"][0]:
                        Window.w["events"]["KEYDOWN"][1]()


                #     if event.unicode == 's':
                #         print("S")


            # at the end of all event, refresh the screen. If you want to refresh earlier
            # call this instruction
            pygame.display.flip()
        Window.w["ingame"] = False

