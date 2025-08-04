extends StaticBody2D
#var scene = load("res://Scenes/in_game_ui.tscn")
var growth_stage = Global.tulip_stage
@onready var plant = $TulipAnimation

var flower_name = "Tulip - Tulipa gesneriana"
var fact1 = "The only colour tulips aren't available in is blue"
var fact2 = "While often associated with the Netherlands, tulips originated in Central Asia"
var fact3 = "There are 75 different species and over 3000 varieties currently recognised. "

#This function is called every time the scene is loaded
func _ready():
	#this sets the plants level to the current level progress.
	plant.frame = growth_stage
	
#This function is called every time the 'grow timer' runs out
func _on_grow_timer_timeout():
	#this checks the current plants level then increass the level by 1 and
	#sets the apearance of the flower to its new level.
	if Global.tulip_daily_water == false:
		print("testing timer")
		print(Global.tulip_daily_water)
		if plant.frame == 0:
			plant.frame = 1
			Global.tulip_stage = 1
			$GrowTimer.stop()
		elif plant.frame == 1:
			plant.frame = 2
			Global.tulip_stage = 2
			$GrowTimer.stop()
		elif plant.frame == 2:
			plant.frame = 3
			Global.tulip_stage= 3
			$GrowTimer.stop()
		elif plant.frame == 3:
			plant.frame = 4
			Global.tulip_stage = 4
			$GrowTimer.stop()
		elif plant.frame == 4:
			plant.frame = 5
			Global.tulip_stage = 5
		Global.tulip_daily_water = true
		print("end of level up")
		print(Global.tulip_daily_water)

#This function runs when the player interacts with the plant
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		#If the player has a watering can then it starts the growth timer and runs
		#the growth animation
		Global.tulip_interaction = true
		if Global.watercan == true:
			print("water can test")
			$GrowTimer.start()
			$TulipAnimation.play("TulipGrowth")
		#This allows the fact viewer to be set as visible on the HUD
		Global.fact_view = true
		give_facts()
			
#his function checks the current plant level before sending any unlocked
#facts to the fact viewer for the player to see
func give_facts():
	if  Global.tulip_stage > 1:
			Global.fact_name = flower_name
	if  Global.tulip_stage > 2:
			Global.fact_one = fact1
	if  Global.tulip_stage > 3:
			Global.fact_two = fact2
	if  Global.tulip_stage > 4:
			Global.fact_three = fact3
func clear_facts():
	Global.fact_name = "???"
	Global.fact_one = "???"
	Global.fact_two = "???"
	Global.fact_three = "???"
#This function runs when the player stops interacting with the plant
#it disables the fact viewer on the HUD
func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		Global.tulip_interaction = false
		Global.fact_view = false
		clear_facts()
		
