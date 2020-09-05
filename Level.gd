extends Node2D

var inGame = false
var pinHit = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	if Input.is_action_just_pressed("r"):
		inGame = false
		$BallRestartMessage.hide()
		gameOver()
		$HUD.strengthSetText($Ball.strength)
	if Input.is_action_just_pressed("ui_up"):
		$Ball.strength += 100
		print($Ball.strength)
		$HUD.strengthSetText($Ball.strength)
	if Input.is_action_just_pressed("ui_down"):
		$Ball.strength -= 100
		print($Ball.strength)
		$HUD.strengthSetText($Ball.strength)

func newGame():
	$BallRestartMessage.hide()
	$Ball.stopTimer()
	$Arm.start() 
	$Ball.start($BallStartPos.position)
	$Pin.start($PinStartPos.position)
	inGame = true
	
func gameOver():
	$HUD.newGame()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$BallRestartMessage.hide()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HUD_start_game():
	newGame()


func _on_MessageTimer_timeout():
	$BallRestartMessage.show()




func _on_Pin_body_entered(body):
	if inGame && !pinHit: 
		print("pin hit")
		pinHit = true
		$HUD.update_score(100)
		
