extends Node3D

var interactable = true
var opened = false
var key = red_card

@export var red_card: Node3D
@export var locked: bool
@onready var door = self

# Called when the node enters the scene tree for the first time.
func interacts():
	if locked:
		$locked.play()
		if locked and red_card == null:
			locked = false
	elif interactable && !locked:
		interactable = false
		opened = !opened
		if !opened:
			$close.play()
			$AnimationPlayer.play("dooropen")
		if opened:
			$open.play()
			$AnimationPlayer.play("doorclose")
		await get_tree().create_timer(1.0, false).timeout
		interactable = true 
	#if interactable && locked:
		#interactable = false
		#$locked.play() 
		#$AnimationPlayer.play("locked")
		#await get_tree().create_timer(0.7, false).timeout
		#interactable = true 

