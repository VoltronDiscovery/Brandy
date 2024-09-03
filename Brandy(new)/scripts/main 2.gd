extends Node3D

@onready var player = $player

func _ready():
	player = get_node("/root/" + get_tree().current_scene.name + "/player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_tree().call_group("monster","update_target_location", player.global_position)
