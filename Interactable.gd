extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3D.hide()

# Called by a signal from the player
func reveal():
	$Label3D.show()

# Reveals riddle when player emits a signal to the riddle pedestal
func _on_Player_head_reveal():
	reveal()
