extends Area2D


func _ready():
	$AnimatedSprite.play("trap") 


func _process(delta):
	pass


	


func _on_trap1_body_entered(body):
	if "Player" in body.name:
		body.damage(15)
	
