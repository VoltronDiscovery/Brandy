extends Node3D

# Reference to the AudioStreamPlayer nodes
@onready var music_1 = $music_1
@onready var music_2 = $music_2
@onready var music_timer = $music_timer

# Start playing the firdst music for 3.5 seconds 
func _ready():
	music_1.play()
	
	# Start the timer
	music_timer.start() 
	
# When the timer ends, music switches to the second one
func _on_music_timer_timeout():
	music_1.stop()
	music_2.play()
	
