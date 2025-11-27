extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var track_scene := load("res://Tracks/Track1.tscn")
	var track: Node = track_scene.instantiate()

	var player = Player.new()
	track.add_child(player)

	print(player.get_vehicle())




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
