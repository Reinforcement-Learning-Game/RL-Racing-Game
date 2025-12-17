extends Node

@export
var track_names_to_paths = {
	"Track One": "Track1",
	"Track Two": "Track2",
	"Track Three": "Track3",
	"Track Four": "Track4",
	"Track Five": "Track5",
	"Track Six": "Track6",
	"Track Seven": "Track7"
}

enum GameState {
	SETTING_UP,
	IN_PROGRESS,
	ENDED
}
var game_state = GameState.SETTING_UP
var agents #: Agent[]
var player: Player

var parent_dir = "res://Tracks/"

func set_track(track_name):
	get_tree().change_scene_to_file(parent_dir + track_name + ".tscn")

	# get all with group "agent"
	# get all with group "vehicle_spawn"
	# set each 

func add_agents_to_track(num_agents: int, has_player: bool):
	var track = get_tree().current_scene

	for i in range(num_agents):
		var agent = AiAgent.new()
		track.add_child(agent)

	if has_player:
		var player_spawn: Node3D = get_tree().get_nodes_in_group("Player_Spawn")[0]
		player = Player.new()
		player.get_vehicle().position = player_spawn.position
		track.add_child(player)

	game_state = GameState.IN_PROGRESS

func start_game(track_name: String, num_agents: int, has_player: bool):
	set_track(track_name)
	await get_tree().create_timer(1).timeout
	add_agents_to_track(num_agents, has_player)

func increment_laps(player: Player):
	pass


	
		
