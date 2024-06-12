extends Node2D

# Takes you to the feedback section  of Brandy.
func _on_link_button_pressed():
	pass # Replace with function body.

# Takes you back to the main menu.
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
