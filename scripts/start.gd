extends Node2D

# Animation for my first aniamtion 
func _ready():
	$AnimationPlayer.play("animation1")
	await get_tree().create_timer(6).timeout
	$AnimationPlayer.play("animation1")
	await get_tree().create_timer(6).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn)



