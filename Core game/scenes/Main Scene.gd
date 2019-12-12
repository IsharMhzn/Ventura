extends Node

onready var platform=preload("res://Props/platform.tscn")
onready var door=preload("res://Props/Door.tscn")
onready var floor_trap_collection= get_node("Floor_Trap collection")
onready var platform_collection=get_node("platform_collector")
onready var door_collection=get_node("door_collection")
onready var player=get_node("Player")

func _ready() -> void:
	spawn_platforms(1)
	spawn_doors(1)
	set_physics_process(true)
	
func _physics_process(delta: float) -> void:
	pass
	
func spawn_platforms(num: int)-> void:
	for i in range (0,num):
		var p=platform.instance()
		p.set_name("Platform_"+str(i+1))
		platform_collection.add_child(p)
		print(platform_collection.get_child(i).get_name())
		p.connect("pressed",self,"check_door_condition")
		p.connect("unpressed",self,"check_door_condition")
		var platform_name=p.get_name()
		if platform_name=="Platform_1":
			p.set_position(Vector2(625.099,-439.521))
			
func spawn_doors(num: int)-> void:
	for i in range (0,num):
		var d=door.instance()
		d.set_name("Door_"+str(i+1))
		door_collection.add_child(d)
		print(door_collection.get_child(i).get_name())
		var door_name=d.get_name()
		if door_name=="Door_1":
			d.set_position(Vector2(518.425,-559.245))
		if door_name=="Door_2":
			d.set_position(Vector2(506.686,594.834))
			
			
func check_door_condition(platform_name: String):
	print("Signal Caught")
	var platform_index=int(platform_name[-1])-1
	door_collection.get_child(platform_index).check_door()
	
func hit_taken():
	print("Signal connected")
	player.move_and_slide(-player.previous_velocity)
	player.when_hit()