extends CharacterBody2D

var speed = 0.1
var in_chase = false
var player = null
var TimeInSeconds = 1
var walking = false
var idle = false

var xdir = 1
var ydir = 1
var motion = Vector2()

var moving_v_h = 1



func _physics_process(delta):
	var waittime = 1

	if in_chase:

		position -= (player.position - position).normalized() * 50 * delta
		move_and_collide(Vector2(0,0))

func _on_detection_area_body_entered(body):
	player = body
	in_chase = true
#func _on_detection_area_body_exited(body):
#	player = null
#	in_chase = false
#	TimeInSeconds = 1

