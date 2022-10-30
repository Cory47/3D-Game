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


func _on_Player_head_reveal():
	print("It made it here")
	if state == "open":
		pass
	elif state == "" or state == "closed":
		$OpenDoor.play("RESET")
		state = "closed"
	pass # Replace with function body.
