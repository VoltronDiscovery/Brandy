extends Control

var target_scene = "res://scenes/gameover_scene.tscn"
var countdown_duration = 240.0
var countdown_started = true

@onready var timer = $Timer
@onready var timer_label = $Label

# Timer starts
func _ready():
	var timer = $Timer
	var timer_label = $Label
	timer.start()

# When countdown goes to 0, player will be teleported to the gameover scene
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/gameover_screen.tscn")

func _process(delta):
	if countdown_started:
		timer_label.text = "Time left: " + str(round(timer.time_left))
