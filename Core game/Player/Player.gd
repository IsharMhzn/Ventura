extends KinematicBody2D
class_name Player

export var move_speed=1500.0
export var push_speed=120.0
export var hit_speed=120.0
export var friction=-500
export var MAX_SPEED=500

onready var tween=get_node("Tween")
var HEALTH=2000

func _physics_process(delta: float) -> void:
	var motion=Vector2()
	var direction=Vector2()
	randomize()
	direction=calculate_normalized_direction()
	if Input.is_action_just_pressed("Boost"):
		move_speed=3000.0
		MAX_SPEED=750.0
	if Input.is_action_just_released("Boost"):
		move_speed=1500.0
		MAX_SPEED=500.0
	motion=calculate_motion(direction,move_speed,delta)
	motion=limit_velocity(motion)
	move_and_slide(motion)
	if get_slide_count()>0:
		check_box_collision(direction)
	if get_slide_count()==1:
		check_trap_collision(direction)
	
func calculate_normalized_direction() -> Vector2:
	var new_motion= Vector2()
	new_motion.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	new_motion.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	return new_motion

func calculate_motion(direction: Vector2, move_speed: float,delta: float)-> Vector2:
	var vel=Vector2()
	direction.x=direction.x*move_speed
	direction.y=direction.y*move_speed
	if direction.x==0 and direction.y==0:
		direction.x=vel.x*friction
		direction.y=vel.y*friction
	vel.x=vel.x+direction.x
	vel.y=vel.y+direction.y
	return vel

func limit_velocity(velocity:Vector2):
	#USED TO LIMIT THE VELOCITY OF THE CHARACTER TO THE MAX SPEED
	velocity.x=clamp(velocity.x,-MAX_SPEED,MAX_SPEED)
	velocity.y=clamp(velocity.y,-MAX_SPEED,MAX_SPEED)
	return velocity

	
func check_box_collision(direction: Vector2):
	if abs(direction.x)+abs(direction.y)>1:
		return
	var box:= get_slide_collision(0).collider as Box
	if box:
		box.push(direction.normalized()*push_speed)

func check_trap_collision(direction: Vector2):
	var trap:= get_slide_collision(0).collider as Trap 
	if trap:
		var move_to=calculate_position_after_hit(direction)
		print(move_to)
		tween.interpolate_property(self,"position",get_position(),move_to,0.1,Tween.TRANS_BOUNCE,Tween.EASE_OUT)
		tween.start()
		yield(tween,"tween_completed")
		when_hit()
		
func when_hit():
	HEALTH-=10
	print("Remaining Health: "+ str(HEALTH))

func calculate_position_after_hit(direction: Vector2):
	if direction==Vector2(0,0):
		return Vector2(get_position().x-50,get_position().y-50)
	else:
		return Vector2(get_position().x+(direction.x*-50),get_position().y+(direction.y*-50))
	
