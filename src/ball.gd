extends RigidBody2D

var HIGH = 1100
var MEDIUM = 800
var LOW = 500

export var strength = 800
var vectX : float = 1
var vectY : float = 0
var oPosX : float = position.x
var oPosY : float = position.y
var hasLaunched = false
var resetState = false

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		mode = MODE_RIGID
		$AudioStreamPlayer.play()
		hasLaunched = true
		if !resetState : $MessageTimer.start(4)
		var direction = Vector2(vectX,vectY).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO,velocity)
	if Input.is_action_just_pressed("ui_left"):
		if !hasLaunched : preLaunchLeft()
		vectX += .142
		vectY += .142
	if Input.is_action_just_pressed("ui_right"):
		if !hasLaunched : preLaunchRight()
		vectX -= .142
		vectY -= .142
	if !hasLaunched:
		position.x = clamp(position.x,oPosX,oPosX+42)
		position.y = clamp(position.y,oPosY-14,oPosY)
	clamp(strength,500,1100)
func _integrate_forces(state):
	if resetState:
		state.transform = Transform2D(0.0,position)
		resetState = false
		
func strength(dir):
	if dir == "up":
		if strength == MEDIUM: 
			strength = HIGH
			return "HIGH"
		if strength == LOW: 
			strength = MEDIUM
			return "MEDIUM"
		print("strength up")
	if dir == "down":
		if strength == HIGH: 
			strength = MEDIUM
			return "MEDIUM"
		if strength == MEDIUM: 
			strength = LOW
			return "LOW"
		print("strength down")
		
	
		
func start(pos):
	mode = MODE_KINEMATIC
	strength = 500
	position = pos
	oPosX = position.x
	oPosY = position.y
	vectX = 1
	vectY = 0
	hasLaunched = false
	resetState = true
	
	
	
func preLaunchLeft():
	position.x -= 6
	position.y += 2

func preLaunchRight():
	position.x += 6
	position.y -= 2

func stopTimer():
	$MessageTimer.stop()



