extends StaticBody


# Array of Color Blocks to hit
var array = []
var blueHit = false
var greenHit = false
var pinkHit = false
var yellowHit = false
var inProgress = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3D.show()
	$ChessBoard/Hint.hide()
	
	var counter = 0
	for i in self.get_children():
		# Adds just the ColorBlock child nodes to the array
		if i.get_filename() == "res://ColorBlock.tscn":
			i.setBlockColor(counter)
			i.id = counter
			array.append(i)
			counter = counter + 1
		

func isComplete():
	inProgress = false
	$Label3D.hide()
	$ChessBoard/Hint.show()


func _on_Player_click_block(block_num):
	if inProgress:
		
		if block_num == 0 && !greenHit:
			print("1 block")
			greenHit = true
			array[block_num].turnOn()
		elif block_num == 1 && greenHit:
			print("2 Blocks");
			yellowHit = true
			array[block_num].turnOn()
		elif block_num == 2 && yellowHit:
			print("3 Blocks");
			blueHit = true
			array[block_num].turnOn()
		elif block_num == 3 && blueHit:
			pinkHit = true
			array[block_num].turnOn()
			print("Is Complete is run")
			isComplete()
		else:
			blueHit = false
			greenHit = false
			pinkHit = false
			yellowHit = false
			for i in array:
				i.turnOff()
