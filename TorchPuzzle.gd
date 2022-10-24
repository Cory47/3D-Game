extends StaticBody

var array = []
var isComplete = false
var in_progress = false
var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3D.hide()
	counter = 0
	for i in self.get_children().size():
		# Adds just the torch child nodes to the array
		if self.get_children()[i].get_filename() == "res://Torch.tscn":
			self.get_children()[i].id = counter
			array.append(self.get_children()[i])
			print(counter)
			counter = counter + 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
		
func start():
	print("Timer started!")
	$Timer.start()
	in_progress = true


func end():
	print("Timer ended")
	for i in array:
		i.turnOff()
	in_progress = false

# Time trial complete
func complete():
	$Label3D.show()
	
# Checks if time trial complete
func _on_IfCompleteTimer_timeout():
	for i in array:
		if i.isLit:
			isComplete = true
		else:
			isComplete = false
	if isComplete:
		$Timer.stop()
		$IfCompleteTimer.stop()
		complete()
		


func _on_Timer_timeout():
	$Timer.stop()
	isComplete = false
	end()
	


func _on_Player_head_start():
	start()
	
func _on_Player_head_light(torch_num):
	if in_progress:
		array[torch_num].turnOn() # Replace with function body.
