extends KinematicBody2D

var movement_speed = 450
var acceleration = 4000
var motion = Vector2()
var screensize
# Called when the node enters the scene tree for the first time.
func _ready():
	print("OK ready.")
	screensize = get_viewport_rect().size
	position = Vector2(screensize.x/2,2 * screensize.y/3)

func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		for_friction()
	else:
		for_movement(acceleration * axis * delta)
	motion = move_and_slide(motion)
	#position.x = clamp(position.x,0,screensize.x)
	#position.y = clamp(position.y,0,screensize.y)

func get_input_axis():
	var new_vertex = Vector2.ZERO
	new_vertex.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	new_vertex.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return new_vertex.normalized()

func for_friction():
	motion = Vector2.ZERO

func for_movement(value):
	motion += value
	motion = motion.clamped(movement_speed)