extends Area2D

const SPEED = 200
var xposition = Vector2()

func _ready():
	xposition = global_position.x

func _physics_process(delta):
	move_down_screen(delta)
	collide()
	
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()

func move_down_screen(delta):
	global_position.y += SPEED * delta
	global_position.x = xposition

func collide():
	var collider = get_overlapping_bodies()
	
	for item in collider:
		if item == Global.Player:
			Global.GameState.ouch()
		queue_free()