extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		rotate(-1)
		$Timer.start()
	if Input.is_action_just_pressed("ui_left"):
		rotate(.25)
	if Input.is_action_just_pressed("ui_right"):
		rotate(-.25)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	rotate(1)
