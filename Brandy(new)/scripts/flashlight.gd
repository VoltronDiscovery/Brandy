extends SpotLight3D

var pick_up = false 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("flashlight") && pick_up == true:
		visible = !visible
		$toggle.play()


func interacts():
	print("YEP")
