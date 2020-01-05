extends "res://src/Entities/entity.gd"

func _ready() -> void:
	set_process_input(true)

func _physics_process(delta: float) -> void:
	pass

func _on_Area2D_area_entered(area: Area2D) -> void:
	print("Dialogue box will appear")
	