extends StaticBody3D

var flashlight

# Called when the node enters the scene tree for the first time.
func _ready():
	flashlight = get_node("/root/" + get_tree().current_scene.name + "/player/neck/Camera3D/flashlight")
	
func interacts():
	flashlight.pick_up = true 
	queue_free()
	


