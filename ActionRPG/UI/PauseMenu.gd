extends Control

onready var resumeBtn = $PauseContainer/VBoxContainer/ResumeBtn
onready var masterSlider = $SoundsContainer/VBoxContainer/Master
onready var musicSlider = $SoundsContainer/VBoxContainer/Music
onready var effectSlider = $SoundsContainer/VBoxContainer/Effects
onready var mainMenuBtn = $RestartContainer/VBoxContainer/HBoxContainer/Yes

var is_paused = false setget set_is_paused

func _ready():
	masterSlider.value = VolumeSliders.masterVol
	musicSlider.value = VolumeSliders.musicVol
	effectSlider.value = VolumeSliders.effectVol

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

func _on_Master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	VolumeSliders.masterVol = value

func _on_Music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	VolumeSliders.musicVol = value

func _on_Effects_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects"), value)
	VolumeSliders.effectVol = value
