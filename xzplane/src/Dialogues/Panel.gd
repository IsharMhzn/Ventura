extends Panel

var dialog_character_1 = ["I heard there's a monster somewhere near this town. I'm very terrified."]
var dialog_character_2 = ["Bring me a shovel and I'll show you something. BRING IT FASTTT!" , "My father taught me how to dig this morning, come I'll show you."]
var dialog_character_3 = ["A knight just went ahead. He was well equipped." , "Yeah! straight in the north direction."]
var dialog_character_4 = ["It is indeed very dangerous. What creature is it anyways?" , "HUH...What do you want kid?" , "Just get outta here or you'll get hurt by it." , "Whaaaa!!? How did you get there." , "Okay i see you're stubborn. If you think you can kill that beast then take this sword. Don't die."]
var page = 0
var screensize

func _ready() -> void:
	screensize = get_viewport_rect().size
	#self.rect_position.x = screensize.x / 100
	#self.rect_position.y = screensize.y/20

func _on_Timer_timeout() -> void:
	$Text.set_visible_characters($Text.get_visible_characters() + 1)

func _on_Button_pressed() -> void:
	set_visible(false)
