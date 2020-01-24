extends Node2D

onready var tilemap = get_node("TileMap")
onready var player = get_node("Player")
onready var characters = get_node("Characters")
onready var shovel = get_node("Shovel")
onready var portal = get_node("Portal")
onready var enemy = get_node("Enemy")

onready var shovell = preload("res://src/Objects/Magical_item.tscn")

var event_trigger=false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var s= shovell.instance()
	
	shovel.connect("shovel_signal",self,"when_shovel_signal")


func when_shovel_signal(shovel :bool):
	characters.get_child(1)._dialogs(shovel)
	characters.get_child(1).dialog.set_visible(false)