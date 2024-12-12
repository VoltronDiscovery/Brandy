extends Control

var target_scene = "res://scenes/gameover_scene.tscn"
var countdown_duration = 360.0
var countdown_started = false

@onready var timer = $Timer
@onready var timer_label = $Label
@onready var spawn_timer = $SpawnTimer
@onready var timer_label2 = $Label2
@onready var hide_label_timer = $HideLabelTimer
@onready var cutscene_timer = $CutsceneTimer

# Timer starts
func _ready():
	cutscene_timer.start(14)
	
# When countdown goes to 0, player will be teleported to the gameover scene
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/gameover_screen.tscn")

# Timer 
func _process(delta):
	if countdown_started:
		timer_label.text = "Time left: " + str(round(timer.time_left))

# When the spawn timer ends, the text should display "The monster has spawned in!"
func _on_spawn_timer_timeout():
	timer_label2.text = "The monster has spawned in!"
	timer_label2.visible = true
	hide_label_timer.start() 

# When the timer ends for the hide label, the label 2 visibility should be false
func _on_hide_label_timer_timeout():
	timer_label2.visible = false

# When the beginning cutscene timer ends, the main scene timer should activate 
func _on_cutscene_timer_timeout():
	var timer = $Timer
	var timer_label = $Label
	countdown_started = true
	timer.start()
	spawn_timer.start(15)
