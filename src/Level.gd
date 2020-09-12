extends Node2D

var inGame = false
var pinHit = false

var ballCount 

func _process(delta):
	$HUD.ballCountSetText(ballCount)
	if Input.is_action_just_pressed("r"):
		inGame = false
		if ballCount == 1: $HUD.newGame()
		ballCount -= 1
		newBall()
	if Input.is_action_just_pressed("ui_up"):
		$HUD.strengthSetText($Ball.strength("up"))
	if Input.is_action_just_pressed("ui_down"):
		$HUD.strengthSetText($Ball.strength("down"))
		

func newBall():
	$BallRestartMessage.hide()
	$Ball.stopTimer()
	$Arm.start() 
	$Ball.start($BallStartPos.position)
	$Pin.start($PinStartPos.position)
	$HUD.strengthSetText("MEDIUM")
	inGame = true
	
# Called when the node enters the scene tree for the first time.
func _ready():
	ballCount = 5
	$BallRestartMessage.hide()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HUD_start_game():
	ballCount = 5
	newBall()


func _on_MessageTimer_timeout():
	$BallRestartMessage.show()




func _on_Pin_body_entered(body):
	if inGame && !pinHit: 
		print("pin hit")
		pinHit = true
		$HUD.update_score(100)
		
