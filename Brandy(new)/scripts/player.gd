extends CharacterBody3D

var SPEED = 4.0
const JUMP_VELOCITY = 5
const SPRINT_VELOCITY = 2
var movable = true

@onready var pivot = $neck
@onready var camera = $neck/Camera3D
var sensitivity = 0.01

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Mouse motion controls
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			pivot.rotate_y(-event.relative.x * sensitivity / 10)
			camera.rotate_x(-event.relative.y * sensitivity / 10)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(20))
			camera.rotation.y = clamp(camera.rotation.y, deg_to_rad(0), deg_to_rad(0))
			if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	#if event is Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and not Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if movable == true:
		# Handle Jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("left", "right", "forward", "backward")
		var direction = (pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			# Check if sprinting
			if Input.is_action_pressed("sprint"):
				# We are sprinting
				velocity.z *= SPRINT_VELOCITY
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
