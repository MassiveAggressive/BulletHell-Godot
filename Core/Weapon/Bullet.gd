extends Area2D

@export var Speed : float = 100
var Velocity : Vector2 = Vector2.ZERO

func _ready():
	Velocity = Vector2.UP * Speed

func _process(delta):
	position += Velocity * delta

func _on_timer_timeout():
	print("hello")
	queue_free()
