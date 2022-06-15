extends Control

onready var startButton = $VBoxContainer/StartButton
onready var masterSlider = $SoundsContainer/VBoxContainer/Master
onready var musicSlider = $SoundsContainer/VBoxContainer/Music
onready var effectSlider = $SoundsContainer/VBoxContainer/Effects
onready var optionsButton = $VBoxContainer/OptionsButton
onready var controlsBtn = $ControlsContainer/VBoxContainer
onready var controlBackBtn = $ControlsContainer/VBoxContainer/BackBtn
onready var quitButton = $VBoxContainer/QuitButton
onready var backgroundMusic = $BackgroundMusic

var stats = PlayerStats

func _ready():
	backgroundMusic.play()
	startButton.grab_focus()
	masterSlider.value = VolumeSliders.masterVol
	musicSlider.value = VolumeSliders.musicVol
	effectSlider.value = VolumeSliders.effectVol
	$OptionsOverlay.visible = false

func _on_StartButton_pressed():
	stats.set_health(stats.get_max_health())
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_SoundsButton_pressed() -> void:
	$VBoxContainer.visible = !$VBoxContainer.visible
	$OptionsOverlay.visible = !$OptionsOverlay.visible
	$SoundsContainer.visible = !$SoundsContainer.visible
	masterSlider.grab_focus()

func _on_Back_pressed() -> void:
	$VBoxContainer.visible = !$VBoxContainer.visible
	$OptionsOverlay.visible = !$OptionsOverlay.visible
	if $SoundsContainer.visible:
		$SoundsContainer.visible = !$SoundsContainer.visible
	else:
		$ControlsContainer.visible = !$ControlsContainer.visible	
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

func _on_ControlsBtn_pressed() -> void:
	$VBoxContainer.visible = !$VBoxContainer.visible
	$OptionsOverlay.visible = !$OptionsOverlay.visible
	$ControlsContainer.visible = !$ControlsContainer.visible
	controlBackBtn.grab_focus()
