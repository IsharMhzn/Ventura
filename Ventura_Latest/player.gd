extends KinematicBody2D

const SPEED = 500
var velocity = Vector2()
const GRAVITY = 100
const JUMP_SPEED = -1500
const FLOOR = Vector2(0,-1)
var on_ground = false


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_SPEED
			on_ground = false
	
	velocity.y += GRAVITY

	if is_on_floor(): 
		on_ground = true
	else:
		on_ground = false
		
	velocity = move_and_slide(velocity, FLOOR)
	