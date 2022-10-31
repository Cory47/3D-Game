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
			array.append(i)
			counter = counter + 1
			
		

func hit_block(block_num):
	if inProgress:
		if block_num == 0 && !greenHit:
			greenHit = true
		elif block_num == 1 && greenHit:
			yellowHit = true
		elif block_num == 2 && yellowHit:
			blueHit = true
		elif block_num == 3 && blueHit:
			pinkHit = true
			isComplete()
		else:
			blueHit = false
			greenHit = false
			pinkHit = false
			yellowHit = false
		

func isComplete():
	inProgress = false
	$Label3D.hide()
	$ChessBoard/Hint.hide()
