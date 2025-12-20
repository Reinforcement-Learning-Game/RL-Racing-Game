extends Agent
class_name AIAgent

@export
var sight_vectors = [
	Vector3(0, 0, -4),
	Vector3(2, 0, -4)
]

var raycasts: Array[RayCast3D]

var vehicle_control_map: Array[Callable]
func _init():
		super._init()
		vehicle_control_map = [
			Callable(vehicle, "accelerate"),
			Callable(vehicle, "steer_left"),
			Callable(vehicle, "steer_right"),
			Callable(vehicle, "brake")
		]

		for vec in sight_vectors:
			var raycast = RayCast3D.new()
			raycast.exclude_parent = true
			raycast.collide_with_areas = false
			raycast.target_position = vec
			vehicle.add_child(raycast)

func gather_input():
	var distance_vec = []

	for raycast in raycasts:
		var distance = (vehicle.position - raycast.get_collision_point()).length()
		var max_distance = raycast.target_position.length()
		distance_vec.append(distance / max_distance)

	return distance_vec

func input_to_output():
	return [0, 0, 0, 0]

func apply_output(vec: Array):
	for i in range(vec.size()):
		if vec[i] == 1:
			vehicle_control_map[i].call()

func _physics_process(_delta: float):
	var input = gather_input()
	#if input[0]:
	#	print(input[0])
	var output = input_to_output()
	apply_output(output)
	pass
