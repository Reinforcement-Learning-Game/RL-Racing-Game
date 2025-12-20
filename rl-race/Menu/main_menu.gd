extends Node

var button_protoype: PackedScene = load("res://Menu/button_prototype.tscn")
var hc = "HBoxContainer"
var vc = "VBoxContainer"
var tracks_container_path = "PanelContainer/" + vc + "/" + hc + "/MarginContainer/" + vc
var tracks_label_path = tracks_container_path + "/Label"

var agent_settings_cont_path = "PanelContainer/" + vc + "/" + hc + "/MarginContainer2/" + vc
var slider_path = agent_settings_cont_path + "/PanelContainer/" + vc + "/HSlider"
var slider_label_path = agent_settings_cont_path + "/PanelContainer/" + vc + "/Label"
var toggle_player_path = agent_settings_cont_path + "/PanelContainer2/CheckButton" 
var start_button_path = agent_settings_cont_path + "/Button"

var game_settings = {
	"track_name": "",
	"track_button": null,
	"num_agents": 1,
	"toggle_player": false,
}

func create_button(track_name: String):
	var button: Button = button_protoype.duplicate().instantiate()
	button.text = track_name

	return button

func switch_scene():
	if game_settings["track_name"] == "":
		return

	GameManager.start_game(
		GameManager.track_names_to_paths[game_settings["track_name"]],
		game_settings["num_agents"],
		game_settings["toggle_player"]
	)

func set_scene(track_name: String, label: Label):
	game_settings["track_name"] = track_name
	label.text = "Select A Track: " + track_name


func _ready() -> void:
	var m_container = get_node(tracks_container_path)
	var tracks_label = get_node(tracks_label_path)

	for track_name in GameManager.track_names_to_paths:
		var button = create_button(track_name)
		m_container.add_child(button)
		button.pressed.connect(set_scene.bind(track_name, tracks_label))

	var toggle_player_button: Button = get_node(toggle_player_path)
	var slider_button: Slider = get_node(slider_path)
	var slider_label: Label = get_node(slider_label_path)
	var start_button: Button = get_node(start_button_path)

	var set_num_agents = func(value):
		slider_label.text = "Number of AI Agents: " + str(int(value))
		game_settings["num_agents"] = int(value)

	slider_button.value_changed.connect(set_num_agents)

	var set_if_player_spawns = func(toggled_on):
		game_settings["toggle_player"] = toggled_on

	toggle_player_button.toggled.connect(set_if_player_spawns)
	start_button.pressed.connect(switch_scene)
