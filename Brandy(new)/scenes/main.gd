extends Node3D

@onready var player = $player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_tree().call_group("enemy","updated_target_location", player.global_transform.origin)
