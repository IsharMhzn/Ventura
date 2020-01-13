extends Panel

var dialog_character_1 = ["This used to be a peaceful place to spend some time alone. So I came here as usual But heard that a monster came flying and is causing havoc somewhere in this place. I'm very terrified."]
var dialog_character_2 = ["Bring me a shovel and I'll show you something.", "BRING IT FASTTT!", "My father taught me how to dig this morning, come I'll show you."]
var dialog_character_3 = ["A knight just went ahead. He was well equipped." , "Yeah! Straight in the south direction."]
var dialog_character_4 = ["It is indeed very dangerous. What creature is it anyways?" , "HUH...What do you want kid?" , "Just get outta here or you'll get hurt by it." , "Whaaaa!!? How did you get there. Okay i see you're stubborn. If you think you can kill that beast then take this sword. Don't die."]
var shovel = ["Ohh, here's the shovel that kid's been asking me to bring. Guess I'll take it."]
var page = 0
var screensize


func _ready() -> void:
	#self.rect_position.x = screensize.x / 2
	#self.rect_position.y = screensize.y / 4
	pass

func _on_Timer_timeout() -> void:
	$Text.set_visible_characters($Text.get_visible_characters() + 1)

func _on_Button_pressed() -> void:
	set_visible(false)
