extends Node3D

var interactable = true
var opened = false
@onready var door = self.get_parent()

@export var red_card: Node3D
@export var locked: bool

# Called when the node enters the scene tree for the first time.
func interacts():
	print(door)
	if door.name == "Door" and door.has_method("locked") and door.has_method("key"):
		$locked.play()
		if door.locked and door.key == null:
			door.locked = false
	if interactable && !locked:
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
	if interactable && locked:
		interactable = false
		$locked.play() 
		$AnimationPlayer.play("locked")
		await get_tree().create_timer(0.7, false).timeout
		interactable = true 

