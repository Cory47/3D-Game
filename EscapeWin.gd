extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal game_win

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pedestal_area_entered(area):
	self.show()
	emit_signal("game_win")
