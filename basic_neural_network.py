import numpy as np
import random, time, sys

class Data(Object):
	def __init__(X, y=None):
		try:
			self.X = np.array(self.X)
		except:
			raise Exception("Data cannot be converted into np array. Make sure it is of a constant type and shape")
		self.shape = self.in_shape = self.X.shape
		self.X = X
		if y == None:
			self.labeled = False
		else:
			self.labeled = True
			self.y = self.labels = y
			self.out_shape = y.shape

class Neuron(Object):
	def init()
