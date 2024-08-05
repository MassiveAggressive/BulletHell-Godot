extends CharacterBody2D

class_name Player

@export var MaxSpeed : float = 50

@export var BulletScene : PackedScene

func _input(event):
	if event.is_action_pressed("LeftMouseButton"):
		pass

func _process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("MoveLeft"):
		velocity.x += -1
	if Input.is_action_pressed("MoveRight"):
		velocity.x += 1
		
	if Input.is_action_pressed("MoveDown"):
		velocity.y += 1
	if Input.is_action_pressed("MoveUp"):
		velocity.y += -1
		
	velocity = velocity.normalized() * MaxSpeed
	
	look_at(get_global_mouse_position())
	move_and_slide()
