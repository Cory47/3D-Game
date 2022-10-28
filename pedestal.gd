extends StaticBody

var riddle3 = "riddle3"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3D.text = riddle3
	$Label3D.hide()

# Called by a signal from the player
func reveal():
	$Label3D.show()

# Reveals riddle when player emits a signal to the riddle pedestal
func _on_Player_head_reveal():
	reveal()




func _on_Pedestal_area_entered(area):
	reveal()
	print("collision working")
