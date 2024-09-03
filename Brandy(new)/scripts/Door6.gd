extends StaticBody3D

var interactable = true 
var opened = false 

# Code to open and close the door
func interacts():
	if interactable == true:
		interactable = false
		opened = !opened
		if opened == false:
			$close.play()
			$AnimationPlayer.play("doorclose")
		if opened == true:
			$open.play()
			$AnimationPlayer.play("dooropen")
		await get_tree().create_timer(1.0, false).timeout
		interactable = true
	
