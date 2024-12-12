extends StaticBody3D

@export var door : Node

# Called when the node enters the scene tree for the first time.
func interacts():
	door.locked = false
	queue_free()
