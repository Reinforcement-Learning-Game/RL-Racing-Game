extends Node
class_name Agent

var vehicle_scene := preload("res://Vehicle/VehicleNew.tscn")
var vehicle: Vehicle

func _init():
	vehicle = vehicle_scene.instantiate()
	vehicle.with_data(self)
	add_child(vehicle)

func get_vehicle():
	return vehicle
