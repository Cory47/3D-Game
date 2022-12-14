extends Spatial

signal reveal
signal torch_start
signal light_torch
signal click_block
signal play_note
signal play_note2
signal play_note3
export(NodePath) var cam_path := NodePath("Camera")
onready var cam: Camera = get_node(cam_path)

#raycasting variables
var held_object: Object
var static_object: Object
var torch: Object
var block: Object

export var mouse_sensitivity := 2.0
export var y_limit := 90.0
var mouse_axis := Vector2()
var rot := Vector3()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_sensitivity = mouse_sensitivity / 1000
	y_limit = deg2rad(y_limit)


# Called when there is an input event
func _input(event: InputEvent) -> void:
	# Mouse look (only if the mouse is captured).
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		mouse_axis = event.relative
		camera_rotation()


func camera_rotation() -> void:
	# Horizontal mouse look.
	rot.y -= mouse_axis.x * mouse_sensitivity
	# Vertical mouse look.
	rot.x = clamp(rot.x - mouse_axis.y * mouse_sensitivity, -y_limit, y_limit)
	
	get_owner().rotation.y = rot.y
	rotation.x = rot.x


func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		if held_object:
			held_object.mode = RigidBody.MODE_RIGID
			held_object.collision_mask = 1
			held_object = null
			
		
		else: 
			if $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_class() == "RigidBody":
				held_object =  $Camera/RayCast.get_collider()
				held_object.mode = RigidBody.MODE_KINEMATIC
				held_object.collision_mask = 0
				print(held_object)
			elif $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_name() == "ChessPuzzle":
				print("Chess Raycast Test")
				emit_signal("reveal")
			elif $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_name() == "TorchPuzzle":
				emit_signal("torch_start")
				

			elif $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_name() == "Torch":
				torch = $Camera/RayCast.get_collider().get_parent()
				print(torch)
				light_torch(torch.getID())
			elif $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_name() == "NoteBlock":
				emit_signal("play_note")
				print("note1")
			elif $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_name() == "NoteBlock2":
				emit_signal("play_note2")
				print("note2")
			elif $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_name() == "NoteBlock3":
				emit_signal("play_note3")
				print("note3")
				
			elif $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_name() == "ColorPuzzle":
				emit_signal("color_start")
			elif $Camera/RayCast.get_collider() and $Camera/RayCast.get_collider().get_name() == "ColorBlock":
				print("Raycast is triggering")
				block = $Camera/RayCast.get_collider().get_parent()
				print(block)
				print(block.getID())
				click_block(block.getID())
				
			else:
				#var myString = $Camera/RayCast.get_collider().get_name()
				static_object =  $Camera/RayCast.get_collider()
				print(static_object)
				
				
				emit_signal("reveal")
			
				
				
	if held_object:
		held_object.global_transform.origin = $Camera/HoldPosition.global_transform.origin
		
		
func light_torch(torch_num):
	emit_signal("light_torch", torch_num)
	
func click_block(block_num):
	emit_signal("click_block", block_num)
	
	
