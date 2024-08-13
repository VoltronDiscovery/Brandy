extends Node3D

var interactable = true
var opened = false

# Called when the node enters the scene tree for the first time.
func interacts():
	if get_parent().get_parent().locked and get_parent().get_parent().red_card == null:
		get_parent().get_parent().locked = false
	if interactable == true && get_parent().get_parent().locked == false:
		interactable = false
		opened = !opened

		if opened:
			$AnimationPlayer.play("dooropen")
		else:
			$AnimationPlayer.play("doorclose")
		await get_tree().create_timer(2.0, false).timeout
		interactable = true 

