extends Control

onready var startButton = $VBoxContainer/StartButton
onready var optionsButton = $VBoxContainer/OptionsButton
onready var quitButton = $VBoxContainer/QuitButton
onready var backgroundMusic = $BackgroundMusic

var stats = PlayerStats

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	backgroundMusic.play()
	

func _on_StartButton_pressed():
	stats.set_health(stats.get_max_health())
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_OptionsButton_pressed():
	pass # Replace with function body.
