extends KinematicBody2D

const SPEED = 300
onready var hp_bar = get_parent().get_node("ParallaxBackground").get_node("HPbar")
var velocity = Vector2()
const GRAVITY = 50
const JUMP_SPEED = -900
const FLOOR = Vector2(0,-1)
var on_ground = false

var max_hp = 100
var current_hp
var percentage_hp

var is_dead = false

const FIREBALL = preload("res://Fireball.tscn")

func _ready():
	current_hp = max_hp

func dead():
	#HP bar code:
	current_hp -= 20
	percentage_hp = int(float(current_hp) / (max_hp) * 100)
	get_parent().get_node("ParallaxBackground/HPbar/Tween_hp").interpolate_property(hp_bar, 'value', hp_bar.value, percentage_hp, 0.1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	get_parent().get_node("ParallaxBackground/HPbar/Tween_hp").start()
	if percentage_hp > 40:
		hp_bar.set_tint_progress("fadf69")
	elif hp_bar.value <= 40:
		hp_bar.set_tint_progress("e41616")
		
	
	#Death code:
	if current_hp <= 0:
		is_dead = true
		velocity = Vector2(0,0)
		$AnimatedSprite.play("dead")
		$Collision.disabled = true
		$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			velocity.x = 0
			if on_ground == true:
				$AnimatedSprite.play("idle")
		if Input.is_action_pressed("ui_up"):
			if on_ground == true:
				velocity.y = JUMP_SPEED
				on_ground = false
		
		if Input.is_action_just_pressed("ui_focus_next"):
			var fireball = FIREBALL.instance()
			if sign($Position2D.position.x)==1:
					fireball.set_fireball_direction(1)
			else:
					fireball.set_fireball_direction(-1)
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position
		
		velocity.y += GRAVITY
	
		if is_on_floor(): 
			on_ground = true
		else:
			on_ground = false
			if velocity.y < 0 :
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("fall")
			
		velocity = move_and_slide(velocity, FLOOR)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "enemy" in get_slide_collision(i).collider.name:
					dead()
	

func _on_Timer_timeout():
	get_tree().change_scene("main.tscn")
