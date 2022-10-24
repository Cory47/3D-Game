extends Spatial

export var id = 0
# Declawre member variables here. Examples:
# var a = 2
# var b = "text"

var isLit = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$OmniLight.hide()

func getID():
	return id

func turnOn():
	isLit = true
	$OmniLight.show()

func turnOff():
	isLit = false
	$OmniLight.hide()

