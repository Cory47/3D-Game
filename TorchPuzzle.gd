extends StaticBody

# Array to hold the candles
var array = []

# Bool for if puzzle is complete
var isComplete = false
# Bool for it puzzle is in progress
var in_progress = false
# Counter for loop
var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	# Sets labels
	$TimerPedastal/TimerLabel.set_text("Start")
	$Label3D.hide()
	
	# Adds all the candle children nodes to the array
	counter = 0
	for i in self.get_children().size():
		# Adds just the torch child nodes to the array
		if self.get_children()[i].get_filename() == "res://Torch.tscn":
			self.get_children()[i].id = counter
			array.append(self.get_children()[i])
			print(counter)
			counter = counter + 1
		
func start():
	# Starts timers and sets in_progress to true
	print("Timer started!")
	$Timer.start()
	$IfCompleteTimer.start()
	in_progress = true


func end():
	# Called when the Timer of the puzzle comes to an end and puzzle is no longer in progress
	print("Timer ended")
	$IfCompleteTimer.stop()
	$TimerPedastal/TimerLabel.set_text("Start")
	
	# Turns off all the candles
	for candle in array:
		candle.turnOff()
	in_progress = false

# Time trial complete
func complete():
	$Label3D.set_text("Clue 2")
	$Label3D.show()
	$TimerPedastal/TimerLabel.hide()
	
# Checks if time trial complete
func _on_IfCompleteTimer_timeout():
	$TimerPedastal/TimerLabel.set_text(String(int($Timer.get_time_left())))
	for i in array:
		if i.isLit:
			isComplete = true
		else:
			isComplete = false
	if isComplete:
		$Timer.stop()
		$IfCompleteTimer.stop()
		complete()
		

# Timer ends when player has ran out of time to solve puzzle
func _on_Timer_timeout():
	$Timer.stop()
	isComplete = false
	end()
	

# Signal reception methods 

# Starts puzzle on signal
func _on_Player_head_start():
	start()

# Lights torch on signal
func _on_Player_head_light(torch_num):
	if in_progress:
		array[torch_num].turnOn()
