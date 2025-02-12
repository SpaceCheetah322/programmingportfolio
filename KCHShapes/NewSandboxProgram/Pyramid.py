import math

class Pyramid:
    def __init__(self, l, w, h):
        self.l = l
        self.w = w
        self.h = h
       
        self.slant_l = math.sqrt((w / 2) ** 2 + h ** 2)  # Slant heights 
        self.slant_w = math.sqrt((l / 2) ** 2 + h ** 2)
    
    def calcVol(self):
        return (1/3) * self.l * self.w * self.h
    
    def calcSA(self):
        base_area = self.l * self.w
        lateral_area = (self.l * self.slant_l + self.w * self.slant_w)
        return base_area + lateral_area