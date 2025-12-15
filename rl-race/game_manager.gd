extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var track = get_tree().current_scene

	var player: Node = Player.new()

	track.add_child(player)

	print(player)
	print(player.get_parent())
	print(player.get_vehicle())

	player.get_vehicle().position = Vector3(9.491, 5.574, -0.503);
