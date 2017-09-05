# 

import Tkinter # built-in Python graphics library
import random, time
from abc import ABCMeta, abstractmethod, abstractproperty

class GameObject(Object):
    __metaclass__ = ABCMeta

    def update(self):
        '''Update current location by speed.'''
        self.x += self.x_speed
        self.y += self.y_speed

    @abstractmethod
    def draw(self, canvas):
        pass

    @abstractproperty
    def x(self):
        pass

    @abstractproperty
    def y(self):
        pass

    @abstractproperty
    def size(self):
        pass

    @abstractproperty
    def x_speed(self):
        pass

    @abstractproperty
    def y_speed(self):
        pass

class Circle(GameObject):
    min_size, max_size = 10, 50
    def __init__(self, x, y, x_speed=None, y_speed=None, size=None, color=None):
        '''Create a new circle at the given x,y point with a random speed, color, and size.'''
        self.x = x
        self.y = y
        if x_speed == None:
            self.x_speed = random.randint(-5,5)
        else:
            self.x_speed = x_speed
        if y_speed == None:
            self.y_speed = random.randint(-5,5)
        else:
            self.y_speed = y_speed
        # this creates a random hex string between #000000 and #ffffff
        # we draw it with an outline, so we'll be able to see it on a white background regardless
        if color == None:
            self.color = '#{0:0>6x}'.format(random.randint(00,16**6))
        else:
            self.color = color
        if size == None:
            self.size = random.randint(10,50)
        else:
            self.size = None

    def update(self):
        '''Update current location by speed.'''

        if random.random() > 0.5:
            self.checkWallsBounce()
        else:
            self.checkWallsTesselate()

        self.x += self.x_speed
        self.y += self.y_speed

    
    def draw(self, canvas):
        '''Draw self on the canvas.'''
        canvas.create_oval(self.x - self.size/2, self.y - self.size/2, self.x + self.size/2, self.y + self.size/2,
                           fill=self.color, outline="black")

class Position():
    def __init__(self, x, y=None):
        if y == None:
            if type(x) == tuple or type(x) == list:
                self.x = x[0]
                self.y = x[1]
        else:
            self.x = x
            self.y = y

class Canvas():
    def __init__(self, width=400, height=400, bounce=False, tesselate=False, collide=True):
        root = Tkinter.Tk()
        self.canvas = Tkinter.Canvas(root, width=width, height=height)
        self.canvas.pack()

        self.width = width
        self.height = height

        self.collide=collide
        if tesselate:
            self.tesselate = True
            self.bounce = False
        else:
            self.bounce = bounce

        self.reset()

    def draw(self):
        '''Clear the canvas, have all game objects update and redraw, then set up the next draw.'''
        self.canvas.delete(Tkinter.ALL)

        for game_object in self.game_objects:
            if self.collide:
                for game_object_2 in self.game_objects:
                    self.checkCollision(game_object, game_object_2)

            if self.bounce:
                self.checkBounce(game_object)
            elif self.tesselate:
                self.checkTesselate(game_object)

            game_object.update()
            game_object.draw(self.canvas)

        delay = 33 # milliseconds, so about 30 frames per second
        self.canvas.after(delay, self.draw, self.canvas) # call this draw function with the canvas argument again after the delay

    def checkBounce(self, game_object):
        if game_object.x >= self.width or game_object.x <= 0:
            self.x_speed = -game_object.x_speed
        if game_object.y >= self.height or game_object.y <= 0:
            self.y_speed = -game_object.y_speed

    def checkTesselate(self, game_object):
        if game_object.x >= self.width:
            game_object.x -= self.width
        elif game_object.x <= 0:
            game_object.x += self.width
        if game_object.y >= self.height:
            game_object.y -= self.height
        elif game_object.y <= 0:
            game_object.y += self.height

    def checkCollision(self, game_object_1, game_object_2):
        distance = np.sqrt((game_object_1.x-game_object_2.x)**2 + (game_object_1.y-game_object_2.y)**2)
        min_distance = game_object_1.size + game_object_2.size
        if distance <= min_distance:
            pass


    def addGameObject(self, game_object):
        if isinstance(game_object, GameObject):
            self.game_objects.append(game_object)

    def addCircleAtPos(self, x, y):
        circle = Circle(x, y)
        self.addGameObject(circle)

    def addCircleAtClick(self, event):
        '''Add a new circle where the user clicked.'''
        self.addCircleAtPos(event.x, event.y)

    def reset(event=None):
        '''Clear all game objects.'''
        self.game_objects = []

# this is a standard Python thing: definitions go above, and any code that will actually
# run should go into the __main__ section. This way, if someone imports the file because
# they want to use the functions or classes you've defined, it won't start running your game
# automatically
if __name__ == '__main__':

    # create the graphics root and a 400x400 canvas
    

    for i in range(10):
        x, y = random.randint(max_size, width-max_size), random.randint(max_size, height-max_size)
        addCircle(Position(x, y))
    # circle_b = Circle(100, 150)
    # time.sleep(500)
    
    # if the user presses a key or the mouse, call our handlers
    root.bind('<Key-r>', reset)
    root.bind('<Button-1>', addCircle)

    # start the draw loop
    draw(canvas)

    root.mainloop() # keep the window open

