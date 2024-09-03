extends Area3D


# Teleports the player to the final scene (Congrats)
func _on_FinalDoorArea_body_entered(body):
	if body.name == "Player":
		var main_menu_scene = preload("res://scenes/main_menu.tscn")
		get_tree().change_scene_to_file("res://scenes/main.tscn")
		

