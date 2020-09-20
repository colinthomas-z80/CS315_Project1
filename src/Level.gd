extends Node2D

var inGame = false
var pinHit = false

var ballCount 
var Ball = preload("ball.tscn")
var curBall
var Pin = preload("Pin.tscn")
var deadPinArray = []

func _process(delta):
	$PinPath/PathFollow2D.offset += 2
	$HUD.ballCountSetText(ballCount)
	if Input.is_action_just_pressed("r"):
		if curBall: curBall.queue_free()
		if ballCount == 1:
			ballCount = 0 
			$HUD.newGame()
			removePins()
		elif inGame: 
			ballCount -= 1
			inGame = false
			newBall()
	if Input.is_action_just_pressed("ui_up"):
		if inGame: $HUD.strengthSetText(curBall.strength("up"))
	if Input.is_action_just_pressed("ui_down"):
		if inGame: $HUD.strengthSetText(curBall.strength("down"))
		

func newBall():
	new_ball_instance()
	showKinematicPin()
	$Arm.start() 
	curBall.start($BallStartPos.position)
	$HUD.strengthSetText("MEDIUM")
	inGame = true
	pinHit = false
	
func new_ball_instance():
	curBall = Ball.instance()
	$PinPath/PathFollow2D/Pin.start()
	curBall.position = $BallStartPos.position
	curBall.z_index = $Arm.z_index - 1
	add_child(curBall)

func _ready():
	ballCount = 5
	$PinPath/PathFollow2D/Pin.start()
	

func _on_HUD_start_game():
	ballCount = 5
	newBall()

func _on_Pin_body_entered(body):
	if inGame && !pinHit: 
		hideKinematicPin()
		spawnDeadPin()
		print("pin hit")
		pinHit = true
		$HUD.update_score(100)
	
func spawnDeadPin():
	var pin = Pin.instance()
	pin.position = $PinPath/PathFollow2D.position
	pin.mode = RigidBody2D.MODE_RIGID
	pin.stopAnimation()
	add_child(pin)
	deadPinArray.append(pin)

func removePins():
	if deadPinArray.size():
		for pin in deadPinArray:
			pin.queue_free()
		deadPinArray.clear()
		
func hideKinematicPin():	
	$PinPath/PathFollow2D/Pin.hide()

func showKinematicPin():	
	$PinPath/PathFollow2D/Pin.show()
