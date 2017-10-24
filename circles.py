# Code largely based on Jen Selby's example code circles.py

import Tkinter # built-in Python graphics library
import random, time
import numpy as np
from abc import ABCMeta, abstractmethod, abstractproperty

class SampleClass(object):
	def sampleFunction(self):
		return

function = type(SampleClass.sampleFunction)

def generatePoint(angle, distance):
	return distance*np.cos(angle), distance*np.sin(angle)

def rotatePoint(angle, x, y=None):
	if y == None and type(x) == tuple:
		x, y = x
	new_x = x*np.cos(angle) - y*np.sin(angle)
	new_y = x*np.sin(angle) + y*np.cos(angle)
	return new_x, new_y

class GameObject(object):
	__metaclass__ = ABCMeta

	max_speed = 0.5
	max_spin = 0.13
	min_size, max_size = 10, 20


	def __init__(self, x, y, x_speed=None, y_speed=None, spin=None, size=None, color=None):
		'''Create a new circle at the given x,y point with a random speed, color, and size.'''
		self.x = x
		self.y = y
		self.angle = 0
		if x_speed == None:
			self.x_speed = random.uniform(-1, 1)*self.max_speed
		else:
			self.x_speed = x_speed
		if y_speed == None:
			self.y_speed = random.uniform(-1, 1)*self.max_speed
		else:
			self.y_speed = y_speed
		if spin == None:
			self.spin = random.uniform(-1, 1)*self.max_spin
		else:
			self.spin = spin
		# this creates a random hex string between #000000 and #ffffff
		# we draw it with an outline, so we'll be able to see it on a white background regardless
		if color == None:
			self.color = '#{0:0>6x}'.format(random.randint(00,16**6))
		else:
			self.color = color
		if size == None:
			self.size = random.randint(self.min_size, self.max_size)
		else:
			self.size = 1

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

	def update(self):
		'''Update current location by speed.'''
		self.x += self.x_speed
		self.y += self.y_speed
		self.angle += self.spin

class Circle(GameObject):
	__metaclass__ = ABCMeta
	min_size, max_size = 8, 15
	max_speed = 1.0
	max_spin = 0
	x, y, angle, size, x_speed, y_speed = 0, 0, 0, 0, 0, 0

	def draw(self, canvas):
		'''Draw self on the canvas.'''
		canvas.create_oval(self.x - self.size/2, self.y - self.size/2, self.x + self.size/2, self.y + self.size/2, fill=self.color, outline="black")

class Rectangle(GameObject):
	__metaclass__ = ABCMeta
	min_size, max_size = 10, 25
	max_speed = 0.8
	x, y, angle, size, x_speed, y_speed = 0, 0, 0, 0, 0, 0

	def __init__(self, x, y, x_speed=None, y_speed=None, spin=None, size=None, color=None):
		super(Rectangle, self).__init__(x, y, x_speed, y_speed, spin, size, color)
		self.width = random.randint(self.min_size, self.max_size)
		self.height = random.randint(self.min_size, self.max_size)
		self.size = np.sqrt(self.width**2 + self.height**2)
		# self.size = max([self.width, self.height])

	def draw(self, canvas):
		'''Draw self on the canvas.'''
		x, y = self.x - self.width/2, self.y - self.height/2
		points = [(-self.width/2, -self.height/2), (self.width/2, -self.height/2), (self.width/2, self.height/2), (-self.width/2, self.height/2)]
		points = [rotatePoint(self.angle, point) for point in points]
		canvas.create_polygon(self.x + points[0][0], self.y + points[0][1], self.x + points[1][0], self.y + points[1][1], self.x + points[2][0], self.y + points[2][1], self.x + points[3][0], self.y + points[3][1], fill=self.color, outline="black")

class RandomShape(GameObject):
	__metaclass__ = ABCMeta
	min_size, max_size = 4, 25
	min_sides, max_sides = 3, 10
	x, y, angle, size, x_speed, y_speed = 0, 0, 0, 0, 0, 0

	def __init__(self, x, y, x_speed=None, y_speed=None, spin=None, size=None, color=None, num_sides=None):
		super(RandomShape, self).__init__(x, y, x_speed, y_speed, spin, size, color)
		if num_sides == None:
			self.num_sides = random.randint(self.min_sides, self.max_sides)
		else:
			self.num_sides = num_sides
		self.points = []
		self.size = 0
		for i in range(self.num_sides):
			length = random.uniform(self.min_size, self.max_size)
			if length > self.size:
				self.size = length 
			self.points.append(generatePoint(2*np.pi/self.num_sides*i, length))
		self.size *= 2

	def draw(self, canvas):
		current_points = []
		for (x,y) in self.points:
			new_x, new_y = rotatePoint(self.angle, x, y)
			current_points.append(self.x + new_x)
			current_points.append(self.y + new_y)
		canvas.create_polygon(*current_points, fill=self.color, outline="black")

class Canvas(object):
	def __init__(self, width=400, height=400, bounce=False, tesselate=False, collide=True, delay=1):
		self.root = Tkinter.Tk()
		self.canvas = Tkinter.Canvas(self.root, width=width, height=height)
		self.canvas.pack()

		self.width = width
		self.height = height
		self.delay = delay

		self.collide = collide
		if tesselate:
			self.tesselate = True
			self.bounce = False
		else:
			self.tesselate = False
			self.bounce = bounce

		self.reset()

	def reset(self, event=None):
		'''Clear all game objects.'''
		self.background = []
		self.foreground = []
		self.game_objects = []

	def update(self, callback=None, callback_args=None):
		'''Clear the canvas, have all game objects update and redraw, then set up the next draw.'''
		self.canvas.delete(Tkinter.ALL)
		self.game_objects = self.background + self.foreground
		for i in range(len(self.game_objects)):
			game_object = self.game_objects[i]
			if self.collide:
				for game_object_2 in self.game_objects[i+1:]: # index+1 and on ensures no duplicates or same object
					self.checkCollision(game_object, game_object_2)

			if self.bounce:
				self.checkBounce(game_object)
			elif self.tesselate:
				self.checkTesselate(game_object)

			game_object.update()

		if type(callback) == function:
			if callback_args != None:
				if type(callback_args) == list:
					callback(*callback_args)
				else:
					callback(callback_args)
			else:
				callback()

	def drawBackground(self, callback=None, callback_args=None):
		for game_object in self.background:
			game_object.draw(self.canvas)

		if type(callback) == function:
			if callback_args != None:
				if type(callback_args) == list:
					callback(*callback_args)
				else:
					callback(callback_args)
			else:
				callback()

	def drawForeground(self, callback=None, callback_args=None):
		for game_object in self.foreground:
			game_object.draw(self.canvas)

		if type(callback) == function:
			if callback_args != None:
				if type(callback_args) == list:
					callback(*callback_args)
				else:
					callback(callback_args)
			else:
				callback()

	def iterate(self, _=None):
		self.update(self.drawBackground, [self.drawForeground])
		self.canvas.after(self.delay, self.iterate, self.canvas) # call this function with the canvas argument again after the delay

	def run(self):
		self.iterate()
		self.root.mainloop() # keep the window open

	def checkBounce(self, game_object):
		if (game_object.x + game_object.size/2 >= self.width and game_object.x_speed > 0) or (game_object.x - game_object.size/2 <= 0  and game_object.x_speed < 0):
			game_object.x_speed = -game_object.x_speed
		if (game_object.y + game_object.size/2 >= self.height and game_object.y_speed > 0) or (game_object.y - game_object.size/2 <= 0 and game_object.y_speed < 0):
			game_object.y_speed = -game_object.y_speed

	def checkTesselate(self, game_object):
		if game_object.x + game_object.size/2 >= self.width and game_object.x_speed > 0:
			game_object.x -= self.width
		elif game_object.x - game_object.size/2 <= 0 and game_object.x_speed < 0:
			game_object.x += self.width
		if game_object.y + game_object.size/2 >= self.height and game_object.y_speed > 0:
			game_object.y -= self.height
		elif game_object.y - game_object.size/2 <= 0 and game_object.y_speed < 0:
			game_object.y += self.height

	def checkCollision(self, game_object_1, game_object_2):
		distance = np.sqrt((game_object_1.x-game_object_2.x)**2 + (game_object_1.y-game_object_2.y)**2)
		min_distance = (game_object_1.size + game_object_2.size)/2.0
		if distance <= min_distance:
			game_object_1.mass = game_object_1.size**2
			game_object_1.direction = np.arctan2(game_object_1.y_speed, game_object_1.x_speed)
			game_object_1.speed = np.sqrt(game_object_1.x_speed**2 + game_object_1.y_speed**2)
			game_object_2.mass = game_object_2.size**2
			game_object_2.direction = np.arctan2(game_object_2.y_speed, game_object_2.x_speed)
			game_object_2.speed = np.sqrt(game_object_2.x_speed**2 + game_object_2.y_speed**2)
			collisionAngle = np.arctan2(game_object_1.y-game_object_2.y, game_object_1.x-game_object_2.x)
			
			a1 = (game_object_1.speed*np.cos(game_object_1.direction-collisionAngle)*(game_object_1.mass-game_object_2.mass)+2*game_object_2.mass*game_object_2.speed*np.cos(game_object_2.direction-collisionAngle))/(game_object_1.mass+game_object_2.mass)
			b1 = game_object_1.speed*np.sin(game_object_1.direction-collisionAngle)
			a2 = (game_object_2.speed*np.cos(game_object_2.direction-collisionAngle)*(game_object_2.mass-game_object_1.mass)+2*game_object_1.mass*game_object_1.speed*np.cos(game_object_1.direction-collisionAngle))/(game_object_2.mass+game_object_1.mass)
			b2 = game_object_2.speed*np.sin(game_object_2.direction-collisionAngle)
			cos = np.cos(collisionAngle)
			sin = np.sin(collisionAngle)
			
			game_object_1.x_speed = a1*cos - b1*sin
			game_object_2.x_speed = a2*cos + b2*sin
			game_object_1.y_speed = a1*sin + b1*cos
			game_object_2.y_speed = a2*sin + b2*cos

			game_object_1.speed = np.sqrt(game_object_1.x_speed**2 + game_object_1.y_speed**2)
			game_object_2.speed = np.sqrt(game_object_2.x_speed**2 + game_object_2.y_speed**2)

			total_speed = game_object_1.speed**2 + game_object_2.speed**2
			total_spin = game_object_1.spin**2 + game_object_2.spin**2

			spin_distribution = np.random.random()
			game_object_1.spin, game_object_2.spin = np.sqrt(total_spin*spin_distribution), np.sqrt(total_spin*(1-spin_distribution))


	def addGameObject(self, game_object, ground):
		assert isinstance(game_object, GameObject)
		if ground == 'background':
			self.background.append(game_object)
		if ground == 'foreground':
			self.foreground.append(game_object)

	def addCircleAtClick(self, event):
		'''Add a new circle where the user clicked.'''
		circle = Circle(event.x, event.y)
		self.addGameObject(circle, 'background')

	def addRectangleAtClick(self, event):
		'''Add a new rectangle where the user clicked.'''
		rectangle = Rectangle(event.x, event.y)
		self.addGameObject(rectangle, 'foreground')

	def addShapeAtClick(self, event):
		'''Add a new shape where the user clicked.'''
		shape = RandomShape(event.x, event.y)
		self.addGameObject(shape, 'foreground')

	def addObjectAtClick(self, event):
		addType = np.random.choice([self.addCircleAtClick, self.addRectangleAtClick, self.addShapeAtClick], p=[0.3,0.15,0.55])
		addType(event)

	def resetSize(self, event):
		print event.width, event.height
		if event.width == 406 or event.width == 1: # funky error
			return
		self.width = event.width
		self.height = event.height

# this is a standard Python thing: definitions go above, and any code that will actually
# run should go into the __main__ section. This way, if someone imports the file because
# they want to use the functions or classes you've defined, it won't start running your game
# automatically
if __name__ == '__main__':

	canvas = Canvas(tesselate=True,bounce=True,delay=1)#bounce=True)#tesselate=True)#bounce=True)

	for i in range(3):
		x, y = random.randint(Circle.max_size, canvas.width-Circle.max_size), random.randint(Circle.max_size, canvas.height-Circle.max_size)
		canvas.addGameObject(Circle(x, y), 'background')
	
	# if the user presses a key or the mouse, call our handlers
	canvas.root.bind('<Key-r>', canvas.reset)
	canvas.root.bind('<Button-1>', canvas.addObjectAtClick)
	canvas.root.bind("<Configure>", canvas.resetSize)

	# start the draw loop
	canvas.run()

