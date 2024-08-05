extends Node2D

var IsGamePaused : bool = false

func _input(event):
	if event.is_action_pressed("PauseGame"):
		Engine.time_scale = IsGamePaused
		IsGamePaused = !IsGamePaused
