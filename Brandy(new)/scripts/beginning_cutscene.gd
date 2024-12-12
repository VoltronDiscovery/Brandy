extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$cutscene2.play("cutscene")
	$cutscene.current = true 
	await get_tree().create_timer(14.0, false).timeout
	print(get_node("/root/" + get_tree().current_scene.name + "/player"))
	get_node("/root/" + get_tree().current_scene.name + "/player").movable = true
	get_node("/root/" + get_tree().current_scene.name + "/player/neck/Camera3D").current = true
	$cutscene.current = false
	queue_free()
	



