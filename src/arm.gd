extends Node2D

var has_launched = false

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		if !has_launched: 
			rotate(-1)
			$Timer.start()
		has_launched = true
	if Input.is_action_just_pressed("ui_left"):
		rotate(.25)
	if Input.is_action_just_pressed("ui_right"):
		rotate(-.25)
	rotation_degrees = clamp(rotation_degrees,-90,0)

func _on_Timer_timeout():
	rotate(1)

func start():
	rotation_degrees = 0
	has_launched = false
