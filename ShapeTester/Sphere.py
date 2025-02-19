import math 

class Sphere:
    def __init__(self, r):
        self.r = r
        
    def calcVol(self):
        return (4/3 * (math.pi * self.r * self.r * self.r))
    
    def calcSA(self):
        return (math.pi * self.r * self.r * 4)