extends Area2D
export(String , FILE, "*.tscn") var target_stage

func _ready():
	print("Welcome to stage 2")


func _process(delta):
	pass


func _on_ChangeStage_body_entered(body):
	if "Player" in body.name:
		get_tree().changr_scene(target_stage)
		
