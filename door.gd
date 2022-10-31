extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var state = "closed"

# placeholder signal
#func _on_Player_head_reveal():
#	if state == "open":
#		pass
#	elif state == "" or state == "closed":
#		yield(get_tree().create_timer(2), "timeout")
#		$OpenDoor.play("RESET")
#		$hinge/DoorOpeningAudio.play()
#		state = "open"
#	pass # Replace with function body.
