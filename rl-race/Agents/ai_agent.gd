extends Agent
class_name AIAgent

var in_vec = []
var out_vec = []
var vehicle_control_map = [vehicle.accelerate, vehicle.steer_left, vehicle.steer_right, vehicle.brake]

func gather_input():
	pass

func input_to_output():
	return [0, 0, 0, 0]

func apply_output(vec: Array):
	for i in range(out_vec.size()):
		if vec[i] == 1:
			vehicle_control_map[i].call()


func _process(delta: float):
	pass

func _physics_process(delta):
	pass
