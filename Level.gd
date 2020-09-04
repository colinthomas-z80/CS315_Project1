extends Node2D

var inGame = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	if Input.is_action_just_pressed("r"):
		inGame = false
		$BallRestartMessage.hide()
		gameOver()

func newGame():
	$BallRestartMessage.hide()
	$Arm.start() 
	$Ball.start($BallStartPos.position)
	inGame = true
	
func gameOver():
	$HUD.newGame()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	newGame()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HUD_start_game():
	newGame()


func _on_LaunchedButton_pressed():
	$HUD.startTimer()
	print("launch pressed")


func _on_LaunchedButton_button_down():
	$HUD.startTimer()
	print("launch down")


func _on_MessageTimer_timeout():
	$BallRestartMessage.show()
