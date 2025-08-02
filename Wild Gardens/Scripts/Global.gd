extends Node


const PATH :String = "res://save.json"
var data :Dictionary
var access : FileAccess
var key : String = "my super secrey incryption key is.... NCI!"


var player_load_posx = 0
var player_load_posy = 0
var current_scene = 1

var day = 1
var stars_found = 0
var star1 = false
var star2 = false

var current_weather ='Sunny'
var change_time = false

var rose_stage = 1
var rose_interaction = false

var watercan = false
var watercan_notified = false

var fact_view = false
var fact_name = "???"
var fact_one = "???"
var fact_two = "???"
var fact_three = "???"


var star_state = {}

func _reset_global_variables():
	player_load_posx = 0
	player_load_posy = 0
	current_scene = 1

	day = 1
	stars_found = 0
	current_weather ='Sunny'
	change_time = false
	rose_stage = 1
	watercan = false
	watercan_notified = false
	fact_view = false
	fact_name = "???"
	fact_one = "???"
	fact_two = "???"
	var fact_three = "???"
	
#This function is ran when the save game button is pressed
func save_game() -> void:
	#This is the data that is saved inside the directory
	data = {
		day = day,
		stars_found = stars_found,
		rose_stage = rose_stage,
		playerx = player_load_posx,
		playery = player_load_posy,
		current_scene = current_scene,
		watercan = watercan,
		watercan_notified = watercan_notified,
		star_state_saved = star_state
	}
	#This code allows us to save the data to a .Json file while also using encryption to
	#prevent manipulation of the save file outside of the game
	access = FileAccess.open_encrypted_with_pass(PATH, FileAccess.WRITE, key)
	access.store_string(JSON.stringify(data))
	access.close()
	
#this function is called when the load game button is pressed
func load_game() -> void:
	#this checks that a file exists to be loaded from before it trys to load the data
	if FileAccess.file_exists(PATH):
		#this accesses the file using the encrytion key allowing us to pull the data
		access = FileAccess.open_encrypted_with_pass(PATH,FileAccess.READ, key)
		data = JSON.parse_string(access.get_as_text())
		access.close()
		#here we are updating the variables within the game with the data pull
		#from the .json file used to store them
		day = data.day
		stars_found = data.stars_found
		rose_stage = data.rose_stage
		player_load_posx = data.playerx
		player_load_posy = data.playery
		current_scene = data.current_scene
		watercan = data.watercan
		watercan_notified = data.watercan_notified
		star_state.merge(data.star_state_saved,true) 
		#this checks the current scene in the save file and makes sure that that
		#scene is activated
		if current_scene == 1:
			get_tree().change_scene_to_file("res://Scenes/grassland.tscn")
		elif current_scene == 2:			
			get_tree().change_scene_to_file("res://Scenes/forest.tscn")
		#after we load a file this makes sure the current scene is reloaded insure
		#all information is properly reloaded
		get_tree().reload_current_scene()
		get_tree(). paused = false
