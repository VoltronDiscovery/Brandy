extends RayCast3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		var hit = get_collider()
		if hit.has_method("interacts") && Input.is_action_just_pressed("interact"):
			hit.interact()
		
