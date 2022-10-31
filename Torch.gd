extends Spatial

export var id = 0
# Declawre member variables here. Examples:
# var a = 2
# var b = "text"

var isLit = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Torch/OmniLight.hide()

func getID():
	return id

func turnOn():
	isLit = true
	$Torch/OmniLight.show()

func turnOff():
	isLit = false
	$Torch/OmniLight.hide()

