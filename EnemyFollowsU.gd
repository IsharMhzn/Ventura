extends ENEMY
onready var timer=$Timer
onready var enemy=$AnimatedSprite


export var damage=15
export var enemey_speed=200
export var attack_distance=250
export var min_move_distance=70.00

var player : Player

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	var direction = (player.global_position-global_position).normalized()
	var distance_to_player=global_position.distance_to(player.global_position)
	enemy.flip_h=direction.x<0
	if distance_to_player >= min_move_distance:
		move_and_collide(direction* enemey_speed*delta)
	if timer.is_stopped() and distance_to_player <= attack_distance:
		player.damage(damage)
		timer.start(20)
	
func _on_Area2D_body_entered(body):
	if not body is Player:
		return 
	player=body
	set_physics_process(true)
		 
