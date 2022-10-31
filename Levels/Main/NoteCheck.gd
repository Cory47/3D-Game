extends StaticBody


# Declare member variables here. Examples:
var array = []
var counter = 0
signal open_door

# Called when the node enters the scene tree for the first time.
func _ready():

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $NoteBlock.right_note:
		if $NoteBlock2.right_note:
			if $NoteBlock3.right_note:
				emit_signal("open_door")
				print("door")
		
	pass
