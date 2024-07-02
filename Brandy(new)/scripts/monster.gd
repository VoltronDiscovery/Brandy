# This is the monster code 
extends CharacterBody3D

const SPEED = 3.0
var player = null
var gravity = 9.8

@export var player_path : NodePath
@onready var nav_agent := $NavigationAgent3D 


# Called when node enters the scene tree for the first time. 
func _ready():
	player = get_node(player_path)
	
# Called every frame, 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
	velocity = Vector3.ZERO
	nav_agent.set_target_position(player.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
	velocity.y += gravity * delta
	#print(velocity.y)
	move_and_slide()
