extends StaticBody


# Declare member variables here. Examples:
# var a = 2
var note = 0
export var finalNote = 4
var right_note = false
var pitch = ["A","B","C","D","E","F"]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_play_note():
	note = note + 1
	if note >= pitch.size():
		note = 0
	$Pitch.text = pitch[note]
	
	
	if (note == finalNote):
		right_note = true
	else:
		right_note = false
	pass # Replace with function body.
