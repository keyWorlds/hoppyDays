extends KinematicBody2D

var horizontalSpeed = 750
var grav = 3600
var verticalSpeed = -1600

var movement = Vector2()
var UP = Vector2(0, -1)

var worldLimit = 3000

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
	movement.x = 0
	if Input.is_action_pressed("ui_left"):
		movement.x -= horizontalSpeed
	if Input.is_action_pressed("ui_right"):
		movement.x += horizontalSpeed

func jump():
	if Input.is_action_pressed("ui_up") && is_on_floor():
		movement.y += verticalSpeed

func fall(delta):
	if is_on_floor() or is_on_ceiling():
		movement.y = 0
	else:
		movement.y += grav * delta
	
	if movement.y > worldLimit:
		the_end()

func the_end():
	get_tree().change_scene("res://scenes/GameOver.tscn")