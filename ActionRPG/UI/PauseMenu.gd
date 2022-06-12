extends Control

onready var resumeBtn = $PauseContainer/VBoxContainer/ResumeBtn
onready var masterSlider = $SoundsContainer/VBoxContainer/Master
onready var mainMenuBtn = $RestartContainer/VBoxContainer/HBoxContainer/Yes

var is_paused = false setget set_is_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused
		$PauseContainer.visible = true
		$SoundsContainer.visible = false
		$RestartContainer.visible = false
		resumeBtn.grab_focus()

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_ResumeBtn_pressed() -> void:
	self.is_paused = false

func _on_SoundsBtn_pressed() -> void:
	$PauseContainer.visible = !$PauseContainer.visible
	$SoundsContainer.visible = !$SoundsContainer.visible
	masterSlider.grab_focus()

func _on_MainMenuBtn_pressed() -> void:
	$PauseContainer.visible = !$PauseContainer.visible
	$RestartContainer.visible = !$RestartContainer.visible
	mainMenuBtn.grab_focus()

func _on_Back_pressed() -> void:
	$PauseContainer.visible = !$PauseContainer.visible
	$SoundsContainer.visible = !$SoundsContainer.visible
	resumeBtn.grab_focus()

func _on_Yes_pressed() -> void:
	get_tree().change_scene("res://UI/StartMenu.tscn")

func _on_No_pressed() -> void:
	$PauseContainer.visible = !$PauseContainer.visible
	$RestartContainer.visible = !$RestartContainer.visible
	resumeBtn.grab_focus()
