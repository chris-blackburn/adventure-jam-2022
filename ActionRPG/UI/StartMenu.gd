extends Control

onready var startButton = $VBoxContainer/StartButton
onready var optionsButton = $VBoxContainer/OptionsButton
onready var quitButton = $VBoxContainer/QuitButton
onready var masterSlider = $SoundsContainer/VBoxContainer/Master

func _ready():
	startButton.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_SoundsButton_pressed() -> void:
	$VBoxContainer.visible = !$VBoxContainer.visible
	$SoundsContainer.visible = !$SoundsContainer.visible
	masterSlider.grab_focus()


func _on_Back_pressed() -> void:
	$VBoxContainer.visible = !$VBoxContainer.visible
	$SoundsContainer.visible = !$SoundsContainer.visible
	startButton.grab_focus()


func _on_OptionsButton_pressed():
	pass # Replace with function body.

