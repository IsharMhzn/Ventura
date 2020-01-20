extends KinematicBody2D

var is_talkable = true
var is_inside_area = false

onready var portal = get_parent().get_node("Portal")
onready var dialog: Panel = $DialogBox

func _process(delta: float) -> void:
	if is_inside_area and is_talkable:
		if Input.is_action_just_pressed("Z_button"):
			print("z button pressed")
			is_talkable = false
			dialog.set_visible(true)
			dialog.get_node("Text").set_bbcode(dialog.magical_item[0])
			dialog.get_node("Text").set_visible_characters(0)
			portal.set_visible(true)
			print("Taken the magical item.")

func _on_Area2D_area_entered(area: Area2D) -> void:
	print("Dialogue box will appear")
	is_inside_area = true


func _on_Area2D_area_exited(area: Area2D) -> void:
	is_inside_area = false
	is_talkable = true
	dialog.set_visible(false)
