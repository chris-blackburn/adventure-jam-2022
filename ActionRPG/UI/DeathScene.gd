extends Control

onready var retryBtn = $CenterContainer/VBoxContainer/RetryBtn
onready var quitBtn = $CenterContainer/VBoxContainer/QuitBtn

var stats = PlayerStats

func _ready():
	retryBtn.grab_focus()

func _on_RetryBtn_pressed():
	stats.set_health(stats.get_max_health())
	get_tree().change_scene("res://World.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
