extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# change scenes to the lobby scene
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/lobby.tscn")

# change scenes to normal screen (Player leaves the game)
func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/settings_tab.tscn")


func _on_exit_ready():
	pass # Replace with function body.
