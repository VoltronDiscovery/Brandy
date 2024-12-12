extends StaticBody3D



var interactable = true
var opened = false

@export var locked: bool

# Called when the node enters the scene tree for the first time.
func interacts():
	if locked:
		$locked.play()
		$AnimationPlayer.play("locked")
	elif interactable and not locked:
		interactable = false
		opened = not opened
		if opened:
			$close.play()
			$AnimationPlayer.play("dooropen")
		if !opened:
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


