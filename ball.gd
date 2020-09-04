extends RigidBody2D

export var strength : float = 500
var vectX : float = 1
var vectY : float = 0
var hasLaunched = false
var resetState = false

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		mode = MODE_RIGID
		hasLaunched = true
		$MessageTimer.start(4)
		var direction = Vector2(vectX,vectY).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO,velocity)
	if Input.is_action_just_pressed("ui_left"):
		if !hasLaunched : preLaunchLeft()
		vectX -= .25
		vectY += .50
	if Input.is_action_just_pressed("ui_right"):
		if !hasLaunched : preLaunchRight()
		vectX += .25
		vectY -= .50
		
func _integrate_forces(state):
	if resetState:
		state.transform = Transform2D(0.0,position)
		resetState = false
		
func start(pos):
	resetState = true
	position = pos
	mode = MODE_KINEMATIC
	vectX = 1
	vectY = 0
	hasLaunched = false
	
	
func preLaunchLeft():
	position.x -= 6
	position.y += 2

func preLaunchRight():
	position.x += 6
	position.y -= 2



