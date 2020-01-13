extends "res://src/Entities/entity.gd"

var enemy_health = 500 
#var _set_visible = false

func _ready() -> void:
	print(enemy_health)
	print(position)
	
func _physics_process(delta: float) -> void:
	if enemy_health < 1:
		queue_free()

func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		enemy_health -= 50
		print(enemy_health)
		get_node("Label").set_text("Health :" + str(enemy_health))
		


func _on_Timer_timeout() -> void:
	if enemy_health < 500 and enemy_health > 50:
		enemy_health += 10
		print(enemy_health)
		get_node("Label").set_text("Health :" + str(enemy_health))
	
