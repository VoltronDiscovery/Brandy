extends StaticBody3D



var interactable = true
var opened = false

@export var locked: bool

# Called when the node enters the scene tree for the first time.
func interacts():
	if locked:
		$locked.play()
		#if red_card != null:
			#locked = false
			#interactable = true 
	elif interactable and not locked:
		interactable = false
		opened = not opened
		#if locked and red_card == null:
			#locked = false
	#elif interactable && !locked:
		#interactable = false
		#opened = !opened
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


