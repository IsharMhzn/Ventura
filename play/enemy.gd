extends KinematicBody2D
const GRAVITY =10
const SPEED=30
const FLOOR=Vector2(0,-1)
var velocity= Vector2()
var direction=1
var is_dead  = false
func _ready():
	pass
	
func dead():
	
	is_dead = true
	velocity =Vector2(0, 0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled=true
	$Timer.start()
	
func _physics_process(delta):
	if is_dead==false:
		velocity.x=SPEED*direction 
		$AnimatedSprite.play("walk")
		if direction==1:
			$AnimatedSprite.flip_h=false
			
		else:
			$AnimatedSprite.flip_h=true
		
		velocity.y+=GRAVITY
		velocity =move_and_slide(velocity ,FLOOR)
	if is_on_wall():
		direction*=-1
		
	
	
		

func _on_Timer_timeout():
	queue_free()
