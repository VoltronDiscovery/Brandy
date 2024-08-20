extends Node3D

var red_card

# Called when the node enters the scene tree for the first time.
func interacts():
	red_card.pick_up = true 
	queue_free()



