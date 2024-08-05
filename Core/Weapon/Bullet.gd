extends Area2D

@export var Speed : float = 100
var Velocity : Vector2 = Vector2.ZERO
var Rot : float

func _ready():
	Velocity = Vector2(1, 0).rotated(global_rotation) * Speed

func _process(delta):
	position += Velocity * delta

func _on_timer_timeout():
	queue_free()
