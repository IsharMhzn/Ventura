extends "res://src/Entities/entity.gd"

onready var dialog: Panel = $DialogBox
onready var portal = get_parent().get_parent().get_node("Portal")

var is_talkable = true
var is_inside_area = false
var dialogs_page = {
	"char_1" : {"page" : 0, "talked" : false},
	"char_2" : {"page" : 0, "talked" : false, "shovel" : false},
	"char_3" : {"page" : 0, "talked" : false},
	"char_4" : {"page" : 0, "talked" : false}
}

func _ready() -> void:
	set_process_input(true)
	

func _physics_process(delta: float) -> void:
	if is_inside_area and is_talkable:
		if Input.is_action_just_pressed("Z_button"):
			print("z button pressed")
			_dialogs()


func _dialogs() -> void:
	if self.name == "Character_1":
		is_talkable = false
		dialog.set_visible(true)
		dialog.get_node("Text").set_bbcode(dialog.dialog_character_1[dialogs_page["char_1"]["page"]])
		dialog.get_node("Text").set_visible_characters(0)
		print("character 1")
		
	elif self.name == "Character_2":
		is_talkable = false
		dialog.set_visible(true)
		dialog.get_node("Text").set_bbcode(dialog.dialog_character_2[dialogs_page["char_2"]["page"]])
		dialog.get_node("Text").set_visible_characters(0)
		dialogs_page["char_2"]["talked"] = true
		print("character 2")
		
	elif self.name == "Character_3":
		is_talkable = false
		dialog.set_visible(true)
		dialog.get_node("Text").set_bbcode(dialog.dialog_character_3[dialogs_page["char_3"]["page"]])
		dialog.get_node("Text").set_visible_characters(0)
		dialogs_page["char_3"]["talked"] = true
		if dialogs_page["char_3"]["talked"] and dialogs_page["char_3"]["page"] < 1:
			dialogs_page["char_3"]["page"] += 1
		print("character 3")
		
	elif self.name == "Character_4":
		is_talkable = false
		dialog.set_visible(true)
		dialog.get_node("Text").set_bbcode(dialog.dialog_character_4[dialogs_page["char_4"]["page"]])
		dialog.get_node("Text").set_visible_characters(0)
		dialogs_page["char_4"]["talked"] = true
		if dialogs_page["char_4"]["talked"] and dialogs_page["char_4"]["page"] <= 1:
			dialogs_page["char_4"]["page"] += 1
		elif is_enemy_dead:
			dialogs_page["char_4"]["page"] = 3
		print("character 4")
		


func _on_Area2D_area_entered(area: Area2D) -> void:
	print("Dialogue box will appear")
	is_inside_area = true

func _on_Area2D_area_exited(area: Area2D) -> void:
	is_inside_area = false
	is_talkable = true
	dialog.set_visible(false)
