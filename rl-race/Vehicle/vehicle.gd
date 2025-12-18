extends VehicleBody3D
class_name Vehicle

@export var ENGINE_FORCE = 2600.0 # proportional to acceleration
@export var BRAKE_FORCE = 270.0
@export var STEER_AMOUNT = PI/128

@export var MASS = 600.0 # 900.0
@export var MAX_VELOCITY = 60
@export var MAX_STEERING = PI/6 # in radians

@export var agent: Agent

func with_data(ownedBy: Agent) -> void:
	agent = ownedBy
	mass = MASS
	self.add_to_group("Vehicle")

func accelerate():
	# might not be needed if friction-force increases as velocity does
	if (linear_velocity.length() >= MAX_VELOCITY):
		engine_force = 0
		return

	engine_force = ENGINE_FORCE

func steer(angle: float):
	if (abs(steering + angle) <= MAX_STEERING):
		steering += angle
	else:
		steering = sign(angle) * MAX_STEERING

func steer_left():
	steer(STEER_AMOUNT)

func steer_right():
	steer(-STEER_AMOUNT)

func apply_brake():
	brake = BRAKE_FORCE

func reset_data(delta): # needed if agent stops control
	engine_force = 0
	steering = lerp(steering, 0.0, 10.0 * delta) # slowly resets steering
	brake = 0

func get_agent():
	return agent

func _process(_delta: float):
	#print("Acceleration:", engine_force)
	#print("Steering:", steering)
	#print("Braking:", brake)
	pass