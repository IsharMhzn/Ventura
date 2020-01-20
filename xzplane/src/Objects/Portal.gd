extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var is_open = false

func _ready() -> void:
	set_visible(false)

func _process(delta: float) -> void:
	pass

func _on_Portal2D_body_entered(body: PhysicsBody2D) -> void:
	if visible:
		print("portal entered")
		body.position.x = 1000
		body.position.y = 4500
		anim_player.play("Fade_In")
		yield(anim_player , "animation_finished")
