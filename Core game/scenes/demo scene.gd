extends Node2D

onready var platform=preload("res://Props/platform.tscn")
onready var door=preload("res://Props/Door.tscn")
onready var trap_collection= get_node("Trap collection")
onready var platform_collection=get_node("Platform collection")
onready var door_collection=get_node("Door collection")
onready var player=get_node("Player")


func _ready() -> void:
	spawn_platforms(2)
	spawn_doors(2)
	trap_collection.get_child(0).set_movement_and_rotation(0,1,0,1,1,1,1)
	trap_collection.get_child(1).set_movement_and_rotation(0,-1,0,1,1,1,1)
	trap_collection.get_child(2).set_movement_and_rotation(0,-1,0,1,1,1,1)
	trap_collection.get_child(3).set_movement_and_rotation(0,0,0,1,1,1,1)
	trap_collection.get_child(4).set_movement_and_rotation(1,0,0,1,1,1,1)
	trap_collection.get_child(5).set_movement_and_rotation(-1,0,0,1,1,1,1)
	trap_collection.get_child(6).set_movement_and_rotation(0,0,0,1,1,1,1)
	trap_collection.get_child(7).set_movement_and_rotation(0,1,0,1,1,1,1)
	trap_collection.get_child(8).set_movement_and_rotation(0,0,0,1,1,1,1)
	trap_collection.get_child(9).set_movement_and_rotation(0,1,0,1,1,1,1)
	trap_collection.get_child(10).set_movement_and_rotation(0,0,0,1,1,1,6)
	
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
			p.set_position(Vector2(1047.335,54.815))
		if platform_name=="Platform_2":
			p.set_position(Vector2(574.547,-2366.907))
			
func spawn_doors(num: int)-> void:
	for i in range (0,num):
		var d=door.instance()
		d.set_name("Door_"+str(i+1))
		door_collection.add_child(d)
		print(door_collection.get_child(i).get_name())
		var door_name=d.get_name()
		if door_name=="Door_1":
			d.set_position(Vector2(749.297,-687.405))
		if door_name=="Door_2":
			d.set_position(Vector2(452.14,-2546.477))
			
func check_door_condition(platform_name: String):
	print("Signal Caught")
	var platform_index=int(platform_name[-1])-1
	print(platform_index)
	door_collection.get_child(platform_index).check_door()