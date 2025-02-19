class Box:
    def __init__(self, l, w, h):
        self.l = l
        self.w = w
        self.h = h
        
    def calcVol(self):
        return self.l * self.w * self.h
    
    def calcSA(self):
        return 2 * (self.l * self.w + self.w * self.h + self.h * self.l)