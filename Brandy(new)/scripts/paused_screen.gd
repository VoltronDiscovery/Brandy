extends Control

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("paused"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused
		if get_tree().paused == true:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if get_tree().paused == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#For the resume screeen	
func resume():
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#Back to the main menu
func back_to_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

#Quit the game
func quit_game():
	get_tree().quit()
	


