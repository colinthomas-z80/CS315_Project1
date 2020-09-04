extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hasLaunched = false

func start():
	rotation_degrees = 0
	hasLaunched = false

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		if !hasLaunched: 
			rotate(-1)
			$Timer.start()
		hasLaunched = true
	if Input.is_action_just_pressed("ui_left"):
		if !hasLaunched : rotate(.25)
	if Input.is_action_just_pressed("ui_right"):
		if !hasLaunched : rotate(-.25)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	rotate(1)
