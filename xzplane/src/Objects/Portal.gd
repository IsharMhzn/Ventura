extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var is_open = false

func _process(delta: float) -> void:
	if not is_open:
		visible = false
	else:
		visible = true

func _on_Portal2D_body_entered(body: PhysicsBody2D) -> void:
	if is_open:
		print("portal entered")
		body.position.x = 1000
		body.position.y = 4500
		anim_player.play("Fade_In")
		yield(anim_player , "animation_finished")
