extends KinematicBody2D

export var move_speed=250.0
export var push_speed=120.0

func _physics_process(delta: float) -> void:
	var  motion= Vector2()
	motion=calculate_normalized_motion()
	move_and_slide(motion.normalized()*move_speed,Vector2())
	if get_slide_count()>0:
		check_box_collison(motion)
	
func calculate_normalized_motion() -> Vector2:
	var new_motion= Vector2()
	new_motion.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	new_motion.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	return new_motion
	
func check_box_collison(motion: Vector2)-> void:
	if abs(motion.x)+abs(motion.y)>1:
		return
	var box:= get_slide_collision(0).collider as Box
	if box:
		box.push(push_speed*motion)