class Vehicle:
	def __init__(self, name, vehicleType): # In the initialisation make sure to use self to reference class variables.
		self.name = name; 
		self.vehicleType = vehicleType;
		
	def getVehicleName(self):
		return self.name;
		
	def getVehicleType(self): #To use class variables ensure the use of self.
		return self.vehicleType;
		
		
		
	
	
if __name__ == "__main__":
	CarOne = Vehicle("Apollo", "Electric Car")

	name = CarOne.getVehicleName()
	type = CarOne.getVehicleType()
	
	print("The name of the car is ", name)
	print("The type of the car is ", type)