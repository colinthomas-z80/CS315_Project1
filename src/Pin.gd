extends RigidBody2D
var resetPos = false
var startPosition

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

	
func start():
	mode = RigidBody2D.MODE_KINEMATIC
	
func stopAnimation():
	$AnimatedSprite.stop()
