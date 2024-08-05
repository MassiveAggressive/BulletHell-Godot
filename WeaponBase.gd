extends Node2D

class_name WeaponBase

@export var BulletScene : PackedScene

@export var FireRate : float = 10:
	set(value):
		FireRate = value
		FireDuration = 1 / value
@export var BarrelCount : int = 1

var FireDuration : float
var TimePool : float
var CountThisFrame : bool = false
var IsShooting : bool = false
@export var IsShootAvailable : bool = true

@onready var CurrentScene : Node

func _ready():
	CurrentScene = get_tree().current_scene
	
	set_process(false)
	FireDuration = 1 / FireRate
	print(FireRate)
	StartShooting()

func StartShooting():
	IsShooting = true
	if IsShootAvailable:
		Shoot(0.0)
	set_process(true)
	
func StopShooting():
	IsShooting = false
	
func _process(delta):
	if CountThisFrame:
		TimePool += delta
		if TimePool >= FireDuration:
			if IsShooting:
				HandleTimePool()
			else:
				IsShootAvailable = true
				CountThisFrame = false
				TimePool = 0
				set_process(false)
	else:
		CountThisFrame = true

func HandleTimePool():
	IsShootAvailable = false
	while TimePool >= FireDuration:
		TimePool -= FireDuration
		Shoot(TimePool)

func Shoot(Delta : float):
	var Bullet = BulletScene.instantiate()
	Bullet.global_position = global_position + Vector2.RIGHT.rotated(global_rotation) * Delta * 200
	Bullet.global_rotation = global_rotation
	CurrentScene.add_child(Bullet)
