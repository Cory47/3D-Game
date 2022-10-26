extends StaticBody

func _ready():
	pass #$Sound.play()

func play_sound():
	$Sound.play()

func _on_Player_head_sound():
	play_sound()

#func _on_Sound_finished():
#	# Send audio id for this key somewhere
#	pass # Replace with function body.
