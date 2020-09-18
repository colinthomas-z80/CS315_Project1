extends CanvasLayer

signal start_game


func show_message(text):
	$Message.text = text
	$Message.show()
	
func strengthSetText(text):
	if text != null: $StrengthMeter.text = str("Power: " + str(text))
	
func ballCountSetText(text):
	if text != null: $BallCount.text = str("Ball Count: " + str(text))
func show_game_over():
	show_message("Pins of Fury")
	$ScoreLabel.text = str(0)
	$StartButton.show()
	
	
func update_score(score):
	var cur = int($ScoreLabel.text)
	$ScoreLabel.text = str(cur + score)
	
func newGame():
	show_game_over()


func _on_StartButton_pressed():
	$StrengthMeter.text = str("Power: " + str(500))
	$StartButton.hide()
	$Message.hide()
	emit_signal("start_game")




