extends RigidBody2D
var resetPos = false
var startPosition

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func start(pos):
	position = pos
	startPosition = pos
	rotation_degrees = 0
	mode = MODE_KINEMATIC
	resetPos = true
	mode = MODE_RIGID
	

func _integrate_forces(state):
	if resetPos:
		state.transform = Transform2D(0.0,startPosition)
		resetPos = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func collisionMode():
	mode = MODE_RIGID

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
