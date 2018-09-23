extends KinematicBody2D

var horizontalSpeed = 750
var grav = 3600
var verticalSpeed = -1500
var movement = Vector2()

func _physics_process(delta):
	run()
	fall(delta)
	jump()
	
	move_and_slide(movement)
	
func run():
	if Input.is_action_pressed("ui_left"):
		movement.x = -horizontalSpeed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_right"):
		movement.x = horizontalSpeed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	else:
		movement.x = 0
		$AnimatedSprite.play("idle")

func jump():
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		movement.y = verticalSpeed

func fall(delta):
	if is_on_floor():
		movement.y = 0
	else:
		movement.y += grav * delta