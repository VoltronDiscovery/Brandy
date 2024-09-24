extends Control


# If player clicks try again, they will be teleported to the main scene 
func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

# Exit the game if player clicks this button
func _on_exit_pressed():
	get_tree().quit()
