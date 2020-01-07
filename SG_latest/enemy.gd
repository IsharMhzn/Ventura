extends KinematicBody2D

const GRAVITY = 50
const SPEED = 200
const FLOOR = Vector2(0,-1)

var direction = 1

var velocity = Vector2()

var is_dead = false

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$enemy_AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true
	$Timer.start()

func _ready():
	pass 
	
func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
		
		if direction == 1:
			$enemy_AnimatedSprite.flip_h = false
		else:
			$enemy_AnimatedSprite.flip_h = true
		$enemy_AnimatedSprite.play("walk")
		
		velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	if is_on_wall():
		direction *= -1
		$RayCast2D.position.x *= -1

		
	if $RayCast2D.is_colliding() == false:
		direction *= -1
		$RayCast2D.position.x *= -1

	


func _on_Timer_timeout():
	queue_free()
