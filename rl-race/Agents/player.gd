extends Agent # This script is attached to a node
class_name Player # Gives the script a global name in godot

var camera_pivot: Node3D
var camera3d: Camera3D

var follow_speed := 5.0
var rotation_speed := 5.0

var last_dir: Vector3
var camera_offset = Vector3(0, 1, 4)

func _init():
	# Loading the vehicle scene
	#Will create all of it's nodes
	# Runs the _init function
	# Prepares it to enter the scene
	# Vehicle is now a REAL NODE
	super._init()

	camera_pivot = Node3D.new()
	vehicle.add_child(camera_pivot)

	camera3d = Camera3D.new()
	camera_pivot.add_child(camera3d)

	# Will add the vehicle node as a child of the player node
	#vehicle.global_transform = global_transform
	# Will copy player's position, rotation and scale into the vehicle so that the vehicle does't load in at (0,0)
	# use SceneManager singleton to load vehicle and add it as child of player
	#vehicle =
	# do research on loading Scenes to figure out how to do this

func _process(delta: float) -> void:
	if vehicle == null:
		return

	# Smooth position follow
	camera_pivot.global_position = camera_pivot.global_position.lerp(
		vehicle.to_global(camera_offset),
		follow_speed * delta
	)

	# Smooth rotation follow (Y axis only)
	var target_rot := camera_pivot.global_rotation
	target_rot.y = lerp_angle(
		camera_pivot.global_rotation.y,
		vehicle.global_rotation.y,
		rotation_speed * delta
	)

	camera_pivot.global_rotation = target_rot

func _physics_process(delta: float):
	if vehicle == null: 
		return #Safety check
	vehicle.reset_data(delta) # Calls all of the methods on the vehicle (steering, acceleration, rotatione etc)
	# Input handling
	if (Input.is_action_pressed("Accelerate")):
		vehicle.accelerate()
	if (Input.is_action_pressed("Left")): 
		vehicle.steer_left()
	if (Input.is_action_pressed("Right")):
		vehicle.steer_right()
	if (Input.is_action_pressed("Brake")):
		vehicle.apply_brake()
