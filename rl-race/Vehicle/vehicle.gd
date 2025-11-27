extends VehicleBody3D
class_name Vehicle

@export var ENGINE_FORCE = 30.0 # proportional to acceleration
@export var BRAKE_FORCE = 30.0

@export var MASS = 900.0
@export var MAX_VELOCITY = 60
@export var MAX_STEERING = PI/3 # in radians

func _ready() -> void:
	pass # Replace with function body.

func accelerate():
	# might not be needed if friction-force increases as velocity does
	if (linear_velocity >= MAX_VELOCITY):
		engine_force = 0
		return

	engine_force = ENGINE_FORCE

func steer(angle: float):
	steering = max(steering + angle, sign(angle) * MAX_STEERING)

func apply_brake(force: float):
	brake = force 

func reset_data(delta): # needed if player stops control
	engine_force = 0
	steering = lerp(steering, 0.0, 10.0 * delta) # slowly resets steering
	brake = 0


