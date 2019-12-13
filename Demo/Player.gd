extends KinematicBody2D

export var MAX_SPEED = 450
var acceleration = 3000
var motion = Vector2.ZERO
var screensize

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size
	position = Vector2(screensize.x/2,(screensize.y * 2) / 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var axis =  get_input_axis()
	var friction = acceleration * delta
	if axis == Vector2.ZERO:
		motion = Vector2.ZERO
	else:
		apply_acceleration(axis * acceleration * delta)
	motion = move_and_slide(motion)

func get_input_axis():
	var vertex = Vector2.ZERO
	vertex.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	vertex.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return vertex.normalized()

func apply_acceleration(value):
	motion += value
	motion = motion.clamped(MAX_SPEED)