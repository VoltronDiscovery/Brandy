extends Control

# Changes scenes back to main menu
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
