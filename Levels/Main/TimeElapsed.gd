extends Label

var time_start = 0
var time_now = 0
var minutes
var seconds
signal lose_game

func _ready():
	time_start = OS.get_unix_time()

func _process(delta):
	time_now = OS.get_unix_time()
	var time_elapsed = time_now - time_start
	minutes = (time_elapsed % 3600) / 60
	seconds = time_elapsed % 60
	text = str("Time Elapsed: ", minutes, " min ", seconds, " s")
	if (minutes > 5): 
		emit_signal("lose_game")
