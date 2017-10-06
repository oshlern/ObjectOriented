import Tkinter # Python graphics library
import random
from abc import ABCMeta, abstractmethod, abstractproperty

class GraphicObject(Object):
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

class FlittingBird:
	min_x_speed = 2.0
	max_x_speed = 5.0
	min_y_speed = -1.0
	max_y_speed = 1.0
	size = 15.0

	def display(self):
		self.canvas.create_oval(self.x, self.y, self.x + self.size*2, self.y + self.size, fill=self.fill_color)

	def move(self):
		self.x += self.x_speed
		self.y += self.y_speed

		
		if (self.x > self.canvas.winfo_width()):
			self.x = -self.size

		# if off the top or bottom of the screen, reverse y speed
		if (self.y < -self.size or self.y > self.canvas.winfo_height()):
			self.y_speed = -self.y_speed

		# about 20% of the time, change speed a bit
		if (random.random() > 0.8):
			self.y_speed += random.uniform(-0.5, 0.5)
			self.y_speed = max(self.min_y_speed, self.y_speed)
			self.y_speed = min(self.max_y_speed, self.y_speed)

			self.x_speed += random.uniform(-0.5, 0.5)
			self.x_speed = max(self.min_x_speed, self.x_speed)
			self.x_speed = min(self.max_x_speed, self.x_speed)


class FallingFeather:

	def __init__(self, canvas):
		self.canvas = canvas
		# winfo gets us the current size of the canvas
		self.x = random.uniform(0, self.canvas.winfo_width())
		self.y = random.uniform(-self.canvas.winfo_height(), 0)
		self.x_speed = random.uniform(-1,1)
		self.y_speed = random.uniform(0.5, 1.5)
		self.size = 5.0
		self.fill_color = '#{0:0>6x}'.format(random.randint(00,16**6))

	def display(self):
		self.canvas.create_rectangle(self.x, self.y, self.x + self.size*2, self.y + self.size, fill=self.fill_color)

	def move(self):
		self.x += self.x_speed
		self.y += self.y_speed
		# if off the bottom of the screen, move to the top
		if (self.y > self.canvas.winfo_height()):
			self.y = -self.size

		# about 5% of the time,
		# or if going off the left or right of the screen,
		# reverse x direction
		if (random.random() > 0.95 or self.x < -self.size or self.x > self.canvas.winfo_width()):
			self.x_speed = -self.x_speed



if __name__ == '__main__':
		# create the graphics root and a 400x400 canvas
		root = Tkinter.Tk()
		canvas = Tkinter.Canvas(root, width=600, height=400)
		canvas.pack()
		canvas.update() # need this for the canvas object to have the correct height set

		sb1 = SoaringBird(canvas)
		sb2 = SoaringBird(canvas)
		sb3 = SoaringBird(canvas)
		sb4 = SoaringBird(canvas)
		sb5 = SoaringBird(canvas)

		fb1 = FlittingBird(canvas)
		fb2 = FlittingBird(canvas)
		fb3 = FlittingBird(canvas)
		fb4 = FlittingBird(canvas)
		fb5 = FlittingBird(canvas)

		ff1 = FallingFeather(canvas)
		ff2 = FallingFeather(canvas)
		ff3 = FallingFeather(canvas)
		ff4 = FallingFeather(canvas)
		ff5 = FallingFeather(canvas)
		ff6 = FallingFeather(canvas)
		ff7 = FallingFeather(canvas)
		ff8 = FallingFeather(canvas)
		ff9 = FallingFeather(canvas)
		ff10 = FallingFeather(canvas)

		# define the draw loop
		def draw():
			canvas.delete(Tkinter.ALL)

			sb1.move()
			sb2.move()
			sb3.move()
			sb4.move()
			sb5.move()

			fb1.move()
			fb2.move()
			fb3.move()
			fb4.move()
			fb5.move()

			ff1.move()
			ff2.move()
			ff3.move()
			ff4.move()
			ff5.move()
			ff6.move()
			ff7.move()
			ff8.move()
			ff9.move()
			ff10.move()

			sb1.display()
			sb2.display()
			sb3.display()
			sb4.display()
			sb5.display()

			fb1.display()
			fb2.display()
			fb3.display()
			fb4.display()
			fb5.display()

			ff1.display()
			ff2.display()
			ff3.display()
			ff4.display()
			ff5.display()
			ff6.display()
			ff7.display()
			ff8.display()
			ff9.display()
			ff10.display()

			delay = 33 # milliseconds, so about 30 frames per second
			canvas.after(delay, draw) # call this draw function again after the delay

		# start the draw loop
		draw()

		root.mainloop() # keep the window open
