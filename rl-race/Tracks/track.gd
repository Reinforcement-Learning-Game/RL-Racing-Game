extends Area3D


func agent_entered(body: Node3D) -> void:
	if body.is_in_group("Vehicle"):
		var agent = (body as Vehicle).get_agent()
		if GameManager.agents.has(agent):
			GameManager.increment_laps(agent)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(agent_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
