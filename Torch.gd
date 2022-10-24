extends Spatial

var id
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var isLit = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$OmniLight.hide()

# Receive signal from raycast
func turnOn():
	isLit = true
	$OmniLight.show()

func turnOff():
	isLit = false
	$OmniLight.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
