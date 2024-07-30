extends RayCast3D

var int_text

func _ready():
	int_text = get_node("/root/" + get_tree().current_scene.name + "/UI/interact_text")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		var hit = get_collider()
		print(hit.has_method("interacts"))
		if hit.has_method("interacts"):
			int_text.visible = true
			if Input.is_action_just_pressed("interacts"):
				hit.interacts()
		else:
			int_text.visible = false
	else:
		int_text.visible = false

		
		
