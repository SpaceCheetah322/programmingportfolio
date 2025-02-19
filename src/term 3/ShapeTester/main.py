from Box import Box
from Sphere import Sphere
from Pyramid import Pyramid
from Cone import Cone

print("Welcome to Shape Tester!")

while True:
    print("Enter exit to exit")

    shape = input("Press 1 for box, 2 for a sphere, 3 for a rectangular base pyramid, and 4 for a Cone: ")

    if shape == "exit":
        print("Exiting the program.")
        break

    if shape == "1":
        tempL = float(input("Enter length: "))
        tempW = float(input("Enter width: "))
        tempH = float(input("Enter height: "))
        
        # Instantiate the box
        b1 = Box(tempL, tempW, tempH)
        print("Volume:", b1.calcVol())
        print("Surface Area:", b1.calcSA())

    elif shape == "2":
        tempR = float(input("Enter radius: "))
        
        # Instantiate the sphere
        s1 = Sphere(tempR)
        print("Volume:", s1.calcVol())
        print("Surface Area:", s1.calcSA())

    elif shape == "3":
        tempL = float(input("Enter base length: "))
        tempW = float(input("Enter base width: "))
        tempH = float(input("Enter height: "))
        
        # Instantiate the pyramid
        p1 = Pyramid(tempL, tempW, tempH)
        print("Volume:", p1.calcVol())
        print("Surface Area:", p1.calcSA())
        
    elif shape == "4":
        tempR = float(input("Enter base radius: "))
        tempH = float(input("Enter height: "))
        
        # Instantiate the Cone
        c1 = Cone(tempR, tempH)
        print("Volume:", c1.calcVol())
        print("Surface Area:", c1.calcSA())

    else:
        print("Invalid selection! Please choose 1, 2, 3, or 4.")