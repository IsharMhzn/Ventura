extends Entity

var health = 150

func _ready() -> void:
	print("Player's current health = " + str(health))

func _physics_process(delta: float) -> void:
	var axis =  get_input_axis()
	if axis == Vector2.ZERO:
		motion = Vector2.ZERO
	else:
		apply_acceleration(axis * acceleration * delta)
		move_and_slide(motion)
		
	
	if health < 0:
		position = Vector2(50.0,150.0)
		health = 150

func get_input_axis() -> int:
	var vertex = Vector2.ZERO
	vertex.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	vertex.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return vertex.normalized()

func apply_acceleration(value) -> void:
	motion += value
	motion = motion.clamped(MAX_SPEED)

func _on_Area2D_area_entered(area: Area2D) -> void:
	var Fires = ['Fire_1', 'Fire_2', 'Fire_3']
	if area.get_parent().name in Fires:
		health -= 30
		print("Player's health " + str(health))
	elif area.get_parent().name == "Enemy":
		health -= 50
		print("Collision with enemy! Player's health " + str(health))
	print("Player's current health = " + str(health))


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	pass
