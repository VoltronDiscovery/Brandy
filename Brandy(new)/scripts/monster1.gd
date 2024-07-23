extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

var SPEED = 3.0
var player = null
@export var player_path : NodePath

func _ready():
	player = get_node(player_path)

# monster movement (target player)
func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() *  SPEED	

	velocity = new_velocity
	move_and_slide() 

func update_target_location(target_location):
	nav_agent.set_target_location(target_location)
