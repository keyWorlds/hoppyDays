extends KinematicBody2D

var horizontalSpeed = 750
var grav = 3600
var verticalSpeed = -1500

var movement = Vector2()
var UP = Vector2(0, -1)

func _physics_process(delta):
	update_movement(delta)

func _process(delta):
	update_animation(movement)

func update_movement(delta):
	run()
	fall(delta)
	jump()
	move_and_slide(movement, UP)

func update_animation(movement):
	$AnimatedSprite.update(movement)

func run():
	if Input.is_action_pressed("ui_left"):
		movement.x = -horizontalSpeed
	elif Input.is_action_pressed("ui_right"):
		movement.x = horizontalSpeed
	else:
		movement.x = 0

func jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		movement.y = verticalSpeed

func fall(delta):
	if is_on_floor():
		movement.y = 0
	else:
		movement.y += grav * delta