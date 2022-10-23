extends StaticBody

var array = []
var isComplete = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3D.hide()
	
	for i in self.get_children():
		# Adds just the torch child nodes to the array
		if i.get_filename() == "res://Torch.tscn":
			array.append(i)
			print(i)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
		
func start():
	$Timer.start()


func end():
	for i in array:
		i.turnOff()

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
	
