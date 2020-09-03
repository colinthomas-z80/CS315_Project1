extends RigidBody2D

export var strength : float = 500
var vectX : float = 1
var vectY : float = 0

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		var direction = Vector2(vectX,vectY).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO,velocity)
	if Input.is_action_just_pressed("ui_left"):
		vectX -= .25
		vectY += .25
	if Input.is_action_just_pressed("ui_right"):
		vectX += .25
		vectY -= .25
		
		
