extends Area3D


# Teleports the player to the final scene (Congrats)
func _on_FinalDoorArea_body_entered(body):
	if body.name == "player":
		var main_menu_scene = preload("res://scenes/ending_scene.tscn")
		get_tree().call_deferred("change_scene_to_file", "res://scenes/ending_scene.tscn")
		

