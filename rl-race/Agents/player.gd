extends Node
class_name Player

var vehicle

func new():
    # use SceneManager singleton to load vehicle and add it as child of player
    #vehicle =
    # do research on loading Scenes to figure out how to do this
    pass

func _process(delta: float):
    vehicle.reset_data(delta)

    if (Input.is_action_just_pressed("Accelerate")):
        vehicle.accelerate()
    elif (Input.is_action_just_pressed("Left")): 
        pass # do this
    elif (Input.is_action_just_pressed("Right")):
        pass # do this
    elif (Input.is_action_just_pressed("Brake")):
        pass # do this

func get_vehicle():
    return vehicle