extends Control

var target_scene = "res://scenes/gameover_scene.tscn"
var countdown_duration = 240.0
var countdown_started = true

@onready var timer = $Timer
@onready var timer_label = $Label
@onready var spawn_timer = $SpawnTimer
@onready var timer_label2 = $Label2
@onready var hide_label_timer = $HideLabelTimer

# Timer starts
func _ready():
	var timer = $Timer
	var timer_label = $Label
	timer.start()
	spawn_timer.start(29)

	
# When countdown goes to 0, player will be teleported to the gameover scene
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/gameover_screen.tscn")

func _process(delta):
	if countdown_started:
		timer_label.text = "Time left: " + str(round(timer.time_left))

func _on_spawn_timer_timeout():
	timer_label2.text = "The monster has spawned in!"
	timer_label2.visible = true
	hide_label_timer.start() 

func _on_hide_label_timer_timeout():
	timer_label2.visible = false
