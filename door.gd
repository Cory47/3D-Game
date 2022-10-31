extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = "closed"
var zLoc = Vector3(0.01,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_NotePuzzle_solve_notes():
	if state == "Open":
		pass
	elif state == "closed":
		translate(zLoc);
		yield(get_tree().create_timer(10), "timeout")
		$OpenDoor.play("RESET")
		$hinge/DoorOpeningAudio.play()
		state = "Open"
