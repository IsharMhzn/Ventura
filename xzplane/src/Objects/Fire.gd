extends "res://src/Entities/Enemy.gd"

var movement = Vector2.ZERO
var to_move = false
var Pos = position

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if to_move:
		#movement.y += 2
		#movement.clamped(10)
		#move_and_slide(movement)
		position.y += 2
	if position.y > 300:
		to_move = false
		position = Pos
		$coin.set_visible(false)


func _on_Timer_timeout() -> void:
	to_move = true
	$coin.set_visible(true)
	print("function called")
