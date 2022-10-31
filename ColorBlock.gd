extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$OmniLight.hide()

func setBlockColor(colorNum):
	var newMaterial = SpatialMaterial.new()
	
	# Green
	if colorNum == 0:
		newMaterial.albedo_color = Color(0, 255, 0, 1.0)
	# Yellow
	elif colorNum == 1:
		newMaterial.albedo_color = Color(255, 255, 0, 1.0)
	# Blue
	elif colorNum == 2:
		newMaterial.albedo_color = Color(0, 0, 255, 1.0)
	# Pink
	elif colorNum == 3:
		newMaterial.albedo_color = Color(255, 0, 0, 1.0)
	else:
		newMaterial.albedo_color = Color(255, 255, 255, 1.0)
	$MeshInstance.material_override = newMaterial
	
func getID():
	return id
	
func turnOn():
	$OmniLight.show()
	
func turnOff():
	$OmniLight.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
