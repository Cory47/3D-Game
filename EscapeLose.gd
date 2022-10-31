extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var game_won = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TimeElapsed_lose_game():
	if (game_won == false):
		self.show()

func _on_EscapeWin_game_win():
	game_won = true
