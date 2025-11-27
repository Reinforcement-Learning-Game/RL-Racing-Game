extends Node # This script is attached to a node
class_name Player # Gives the script a global name in godot

var vehicle: Node # Creates a variable named vehicle

func _ready():
	# Loading the vehicle scene
	var vehicle_scene := load("res://Vehicle/Vehicle.tscn")
	vehicle = vehicle_scene.instantiate() # Creating an actual instance of the vehicle scene
	#Will create all of it's nodes
	# Runs the _init function
	# Prepares it to enter the scene
	# Vehicle is now a REAL NODE
	add_child(vehicle)
	# Will add the vehicle node as a child of the player node
	#vehicle.global_transform = global_transform
	# Will copy player's position, rotation and scale into the vehicle so that the vehicle does't load in at (0,0)
	# use SceneManager singleton to load vehicle and add it as child of player
	#vehicle =
	# do research on loading Scenes to figure out how to do this

func _physics_process(delta: float):
	
	if vehicle == null: 
		return #Safety check
	vehicle.reset_data(delta) # Calls all of the methods on the vehicle (steering, acceleration, rotatione etc)
	# Input handling
	if (Input.is_action_just_pressed("Accelerate")):
		vehicle.accelerate()
	elif (Input.is_action_just_pressed("Left")): 
		vehicle.steer_left()
	elif (Input.is_action_just_pressed("Right")):
		vehicle.steer_right()
	elif (Input.is_action_just_pressed("Brake")):
		vehicle.brake()

func get_vehicle():
	return vehicle
