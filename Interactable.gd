extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3D.hide()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
		

# Called by a signal from the player
func reveal():
	$Label3D.show()


func _on_Player_head_reveal():
	reveal()
	pass # Replace with function body.
