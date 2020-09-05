extends CanvasLayer

signal start_game


func show_message(text):
	$Message.text = text
	$Message.show()
	
func strengthSetText(text):
	$StrengthMeter.text = str("Power: " + str(text))
	
func show_game_over():
	show_message("Pins of Fury")
	update_score(0)
	$StartButton.show()
	
	
func update_score(score):
	$ScoreLabel.text = str(score)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func newGame():
	show_game_over()


func _on_StartButton_pressed():
	$StrengthMeter.text = str("Power: " + str(500))
	$StartButton.hide()
	$Message.hide()
	emit_signal("start_game")




