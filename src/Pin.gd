extends RigidBody2D
var resetPos = false
var startPosition
	
func start():
	mode = RigidBody2D.MODE_KINEMATIC
	
func stopAnimation():
	$AnimatedSprite.stop()
