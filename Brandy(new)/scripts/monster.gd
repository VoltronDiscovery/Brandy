extends CharacterBody3D

const SPEED = 1.0
const JUMP_VELOCITY = 4.5
var jumpscareTime = 3
var player 
var caught = false 
var distance: float
@export var scene_name: String
@onready var nav_agent = $NavigationAgent3D 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	set_physics_process(false)
	player = get_node("/root/" +  get_tree().current_scene.name + "/player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Add the gravity.
	if visible and not player == null:
		if not is_on_floor():
			velocity.y -= gravity * delta
		print($NavigationAgent3D.target_position)
		var current_location = global_transform.origin
		var next_location = $NavigationAgent3D.get_next_path_position()
		var new_velocity = (next_location - current_location).normalized() * SPEED
		$NavigationAgent3D.set_velocity(new_velocity)
		var look_dir = atan2(-velocity.x, -velocity.z)
		rotation.y = look_dir
		distance = player.global_transform.origin.distance_to(global_transform.origin)
		if distance <= 2 && caught == false:
			player.visible = false 
			caught = true 
			$cutscene3.play("jumpscare")
			$jumpscare.current = true
			await get_tree().create_timer(10.0, false).timeout
			get_tree().change_scene_to_file("res://scenes/" + scene_name + ".tscn")
		move_and_slide()

func update_target_location(target_location):
	$NavigationAgent3D.target_position = target_location
	print(target_location)

func on_navigation_agent_3d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity, 0.25)
	move_and_slide()


func _on_monster_spawn_timer_timeout():
	set_physics_process(true)
