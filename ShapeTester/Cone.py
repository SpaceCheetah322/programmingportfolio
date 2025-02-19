import math

class Cone:
    def __init__(self, r, h):
        self.r = r
        self.h = h
        
    def calcVol(self):
        return (math.pi * self.r * self.r * (self.h/3))
    
    def calcSA(self):
        return math.pi * self.r * (self.r + math.sqrt((self.h * self.h) + (self.r * self.r)))