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

func _ready():
	walking = true
	randomize()

func _physics_process(delta):
	var waittime = 1
	
	if walking == false:
		var x = randi_range(1,2)
		if x ==1:
			moving_v_h = 1
		elif x ==2:
			moving_v_h = 2
	if walking == true:
		if moving_v_h == 1:
			motion.x = speed *xdir
			motion.y = 0
		elif moving_v_h == 2:
			motion.y = speed*ydir
			motion.x = 0
	if idle == true:
		motion.x = 0
		motion.y = 0
	
	move_and_collide(motion)
	
		
	
	
	
	if in_chase &&  TimeInSeconds > 0:
		
		
		TimeInSeconds -= delta
		position -= (player.position - position).normalized() * 50 * delta
		move_and_collide(Vector2(0,0))
		
		walking = true
	
	
		
		
func _on_detection_area_body_entered(body):
	player = body
	in_chase = true
#func _on_detection_area_body_exited(body):
#	player = null
#	in_chase = false
#	TimeInSeconds = 1


func _on_walk_timer_timeout():
	var x = randi_range (1,2)
	var y = randi_range (1,2)
	var waittime = randi_range (1,4)
	if x == 1:
		xdir = 1
	else: 
		xdir = -1
	if y == 1:
		ydir = 1
	else:
		ydir = -1
	$walkTimer.wait_time = waittime
	$walkTimer.start()

func _on_change_state_timer_timeout():
	var waittime = 1
	if walking == true:
		idle = true
		walking = false
		waittime = randi_range(1,5)
	elif idle == true:
		walking = true
		idle = false
		waittime = randi_range(2,6)
	$ChangeStateTimer.wait_time = waittime
	$ChangeStateTimer.start()

	
