import Tkinter # Python graphics library
import random
from abc import ABCMeta, abstractmethod, abstractproperty

class GraphicObject(object):
	__metaclass__ = ABCMeta

	def __init__(self, canvas):
		self.canvas = canvas
		# winfo gets us the current size of the canvas
		self.x = random.uniform(0, self.canvas.winfo_width())
		self.y = random.uniform(0, self.canvas.winfo_height())
		self.x_speed = random.uniform(self.min_x_speed, self.max_x_speed)
		self.y_speed = random.uniform(self.min_y_speed, self.max_y_speed)
		self.fill_color = '#{0:0>6x}'.format(random.randint(00,16**6))

	@abstractproperty
	def min_x_speed():
		return NotImplementedError

	@abstractproperty
	def max_x_speed():
		return NotImplementedError

	@abstractproperty
	def min_y_speed():
		return NotImplementedError

	@abstractproperty
	def max_y_speed():
		return NotImplementedError

	@abstractproperty
	def size():
		return NotImplementedError

	@abstractmethod
	def display(self):
		return NotImplementedError

	def move(self):
		self.x += self.x_speed
		self.y += self.y_speed
		self.extraMove()

	# if off the side of the screen
	# move to just off the other side of the screen
	def tesselateX(self):
		if self.x > self.canvas.winfo_width() + self.size and self.x_speed > 0:
			self.x = -self.size

		if self.x < -self.size and self.x_speed < 0:
			self.x = self.canvas.winfo_width() + self.size

	# if off the side of the screen
	# move to just off the other side of the screen
	def tesselateY(self):
		if self.y > self.canvas.winfo_height() + self.size and self.y_speed > 0:
			self.y = -self.size

		if self.y < -self.size and self.y_speed < 0:
			self.y = self.canvas.winfo_height() + self.size

	# if off the side of the screen
	# move to just off the other side of the screen
	def reverseX(self):
		if (self.x > self.canvas.winfo_width() + self.size and self.x_speed > 0) or (self.x < -self.size and self.x_speed < 0):
			self.x_speed = -self.x_speed

	def reverseY(self):
		if (self.y > self.canvas.winfo_height() + self.size and self.y_speed > 0) or (self.y < -self.size and self.y_speed < 0):
			self.y_speed = -self.y_speed

	def extraMove(self):
		return

class SoaringBird(GraphicObject):
	min_x_speed = 1.0
	max_x_speed = 3.0
	min_y_speed = 0.0
	max_y_speed = 0.0
	size = 30.0

	def display(self):
		self.canvas.create_oval(self.x, self.y, self.x + self.size*2, self.y + self.size, fill=self.fill_color)

	def extraMove(self):
		self.tesselateX()
		self.tesselateY()

class FlittingBird(GraphicObject):
	min_x_speed = 2.0
	max_x_speed = 5.0
	min_y_speed = -1.0
	max_y_speed = 1.0
	size = 15.0

	def display(self):
		self.canvas.create_oval(self.x, self.y, self.x + self.size*2, self.y + self.size, fill=self.fill_color)

	def extraMove(self):
		# about 20% of the time, change speed a bit
		if (random.random() > 0.8):
			self.y_speed += random.uniform(-0.5, 0.5)
			self.y_speed = max(self.min_y_speed, self.y_speed)
			self.y_speed = min(self.max_y_speed, self.y_speed)

			self.x_speed += random.uniform(-0.5, 0.5)
			self.x_speed = max(self.min_x_speed, self.x_speed)
			self.x_speed = min(self.max_x_speed, self.x_speed)

		self.tesselateX()
		self.tesselateY()

class FallingFeather(GraphicObject):
	min_x_speed = -1.0
	max_x_speed = 1.0
	min_y_speed = 0.5
	max_y_speed = 1.5
	size = 5.0

	def display(self):
		self.canvas.create_rectangle(self.x, self.y, self.x + self.size*2, self.y + self.size, fill=self.fill_color)

	def extraMove(self):
		# about 5% of the time, reverse x direction
		if (random.random() > 0.95):
			self.x_speed = -self.x_speed

		self.reverseX()
		self.tesselateY()



if __name__ == '__main__':
		# create the graphics root and a 400x400 canvas
		root = Tkinter.Tk()
		canvas = Tkinter.Canvas(root, width=600, height=400)
		canvas.pack()
		canvas.update() # need this for the canvas object to have the correct height set

		soaring_birds = [SoaringBird(canvas) for i in range(5)]
		flitting_birds = [FlittingBird(canvas) for i in range(5)]
		falling_feathers = [FallingFeather(canvas) for i in range(10)]
		graphic_groups = [soaring_birds, flitting_birds, falling_feathers]
		
		# define the draw loop
		def draw():
			canvas.delete(Tkinter.ALL)

			for group in graphic_groups:
				for graphic in group:
					graphic.move()
					graphic.display()

			delay = 33 # milliseconds, so about 30 frames per second
			canvas.after(delay, draw) # call this draw function again after the delay

		# start the draw loop
		draw()

		root.mainloop() # keep the window open
