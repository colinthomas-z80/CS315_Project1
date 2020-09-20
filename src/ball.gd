extends RigidBody2D
class_name Ball

export var strength = 800

const HIGH = 1100
const MEDIUM = 800
const LOW = 500

var vectX : float = 1
var vectY : float = 0
var oPosX : float = position.x
var oPosY : float = position.y
var has_launched = false
var is_reset_state = false

func _process(delta):
	if Input.is_action_just_pressed("launch") and !has_launched:
		mode = MODE_RIGID
		$AudioStreamPlayer.play()
		has_launched = true
		var direction = Vector2(vectX,vectY).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO,velocity)
	if Input.is_action_just_pressed("ui_left"):
		if !has_launched : preLaunchLeft()
		vectX += .142
		vectY += .142
	if Input.is_action_just_pressed("ui_right"):
		if !has_launched : preLaunchRight()
		vectX -= .142
		vectY -= .142
	if !has_launched:
		position.x = clamp(position.x,oPosX,oPosX+42)
		position.y = clamp(position.y,oPosY-14,oPosY)
	clamp(strength,500,1100)


func _integrate_forces(state):
	if is_reset_state:
		state.transform = Transform2D(0.0,position)
		is_reset_state = false
		
		
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
	has_launched = false
	is_reset_state = true
	
	
func preLaunchLeft():
	position.x -= 6
	position.y += 2


func preLaunchRight():
	position.x += 6
	position.y -= 2




