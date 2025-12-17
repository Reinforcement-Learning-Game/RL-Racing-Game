extends Node

var button_protoype: PackedScene = load("res://Menu/button_prototype.tscn")

func create_button(track_name: String):
	var button: Button = button_protoype.duplicate().instantiate()
	button.text = track_name

	return button
	
func switch_scene(track_name: String):
	print("here")
	GameManager.start_game(GameManager.track_names_to_paths[track_name], 0, true)

func _ready() -> void:
	var m_container = get_node("PanelContainer/VBoxContainer/MarginContainer/VBoxContainer")

	for track_name in GameManager.track_names_to_paths:
		var button = create_button(track_name)
		m_container.add_child(button)
		button.pressed.connect(switch_scene.bind(track_name))	
		
