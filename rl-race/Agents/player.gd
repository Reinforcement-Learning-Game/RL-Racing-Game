extends Node
class_name Player

var vehicle

func _ready():
    vehicle = Vehicle.new()

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

func _get_vehicle():
    return vehicle