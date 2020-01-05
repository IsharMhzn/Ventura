extends Entity

func _physics_process(delta: float) -> void:
	var axis =  get_input_axis()
	if axis == Vector2.ZERO:
		motion = Vector2.ZERO
	else:
		apply_acceleration(axis * acceleration * delta)
		move_and_slide(motion)

func get_input_axis() -> int:
	var vertex = Vector2.ZERO
	vertex.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	vertex.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return vertex.normalized()

func apply_acceleration(value) -> void:
	motion += value
	motion = motion.clamped(MAX_SPEED)

func _on_Area2D_area_entered(area: Area2D) -> void:
	print("area entered")
