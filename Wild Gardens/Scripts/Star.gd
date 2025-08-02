extends Area2D


var bob_h : float = 5.0
var bob_s :float = 5.0
@onready var start_y :float = global_position.y
@export var id ="0"
var t : float = 0.0

#This function runs everytime the scene is loaded 
func _ready():
	#This checks if the star with that id has been set to true.
	if Global.star_state.has(id) and Global.star_state[id] == true:
		#if it has then this line removes the star from the scene
		queue_free()
	#This code checks to see if a star has an id, if it doesnt then it adds that star to the
	#directory 
	elif !Global.star_state.has(id):
		Global.star_state.merge({id:false},true)

#This function is timed to run every second
func _process(delta):
	#these variables and code gives the star a bobbing up and down appearance within the game.
	t += delta
	var d = (sin(t*bob_s)+ 1)/2 
	global_position.y = start_y + (d*bob_h)

#This function is called when the player walks into a star
func _on_body_entered(body):
	if body.is_in_group("Player"):
		#it sets the star with this id as true
		Global.star_state[id] = true
		#and adds 1 to the stars found counter
		Global.stars_found += 1
		#then removes the star from the current scene
		queue_free()

