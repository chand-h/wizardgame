extends CharacterBody2D

@export var speed = 100
@onready var _animated_sprite = $AnimatedSprite2D
var input_direction : Vector2 = Vector2()
var facing = "right"

func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func _process(delta):
	
	if velocity.x < 0:
		facing = "left"
	if velocity.x > 0:
		facing = "right"
	if velocity.length() > 0:
		_animated_sprite.play("walk" + facing)
	else:
		_animated_sprite.play("idle")
		
