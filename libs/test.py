import time

def getPos_LeftNavigationList(rect):
    x = int(rect['x']) + 100
    y = int(rect['y']) + int(rect['height'])/2
    return [x,y]