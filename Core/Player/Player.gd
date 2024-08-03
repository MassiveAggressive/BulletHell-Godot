extends CharacterBody2D

class_name Player

@export var MaxSpeed : float = 50

@onready var AnimPlayer : AnimationPlayer = $Sprite2D/AnimationPlayer
@export var BulletScene : PackedScene

func _input(event):
	if event.is_action_pressed("LeftMouseButton"):
		pass

func _process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("MoveLeft"):
		velocity.x += -1
		AnimPlayer.play("MoveLeft")
	if Input.is_action_pressed("MoveRight"):
		velocity.x += 1
		AnimPlayer.play("MoveRight")
		
	if Input.is_action_pressed("MoveDown"):
		velocity.y += 1
	if Input.is_action_pressed("MoveUp"):
		velocity.y += -1
		
	if velocity.x == 0:
		AnimPlayer.play("MoveStraight")
		
	velocity = velocity.normalized() * MaxSpeed
	move_and_slide()
