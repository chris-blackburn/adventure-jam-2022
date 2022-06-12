extends Control

onready var startButton = $VBoxContainer/StartButton
onready var masterSlider = $SoundsContainer/VBoxContainer/Master
onready var musicSlider = $SoundsContainer/VBoxContainer/Music
onready var effectSlider = $SoundsContainer/VBoxContainer/Effects

func _ready():
	startButton.grab_focus()
	masterSlider.value = VolumeSliders.masterVol
	musicSlider.value = VolumeSliders.musicVol
	effectSlider.value = VolumeSliders.effectVol

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

func _on_Master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	VolumeSliders.masterVol = value
	

func _on_Music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	VolumeSliders.musicVol = value

func _on_Effects_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects"), value)
	VolumeSliders.effectVol = value
