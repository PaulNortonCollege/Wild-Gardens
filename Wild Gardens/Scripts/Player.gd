extends CharacterBody2D

var move_speed :float = 40.0

var current_dir
var player_state

#this function is set to run every second
func _physics_process(delta):
	#this gets the movement keys that have been assigned within the settings (A, D, W, D)
	#and sets the currently pressed key as the set direction
	var direction = Input.get_vector("Left","Right","Up","Down")
	#This checks if the character is moving or not to assign which animation state to apply.
	if direction.x == 0 and direction.y ==0:
		player_state = "idle"
	elif direction.x !=0 or direction.y != 0:
		player_state = "walking"
	#this code takes the direction pressed and multiplies it by a set speed and uses a
	#preset function to apply the player movement in that direction
	velocity = direction * move_speed
	move_and_slide()
	#this plays the selected animation for that direction
	play_anim(direction)
	
#this is the animation player for the player's character.
func play_anim(dir):
	#it checks if the players state to see which animation to play
	if player_state == "idle":
		$AnimatedSprite2D.play("front_idle")
	#if the character is moving this will check which direction the player is moving and assign
	#the correct animation for that direction
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("back_walk")
		if dir.x == +1:
			$AnimatedSprite2D.play("right_walk")
		if dir.y == +1:
			$AnimatedSprite2D.play("front_walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("left_walk")
	
