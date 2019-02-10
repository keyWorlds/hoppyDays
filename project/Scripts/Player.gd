extends KinematicBody2D

const HORIZONTAL_SPEED = 750
const GRAVITY = 3600
const VERTICAL_SPEED = -1600

var movement = Vector2()
const UP = Vector2(0, -1)
const JUMP_BOOST = 2

var WORLD_LIMIT = 4000

func _ready():
	Global.Player = self

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
	if Input.is_action_pressed("left"):
		movement.x -= HORIZONTAL_SPEED
	if Input.is_action_pressed("right"):
		movement.x += HORIZONTAL_SPEED

func jump():
	if Input.is_action_pressed("up") && is_on_floor():
		movement.y += VERTICAL_SPEED
		Global.JumpSFX.play()

func boost():
	movement.y = VERTICAL_SPEED * JUMP_BOOST

func damage():
	movement.y = VERTICAL_SPEED

func fall(delta):
	if is_on_floor() or is_on_ceiling():
		movement.y = 0
	else:
		movement.y += GRAVITY * delta
	
	if movement.y > WORLD_LIMIT:
		Global.GameState.the_end()