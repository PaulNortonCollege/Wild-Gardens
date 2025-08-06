extends StaticBody2D
#var scene = load("res://Scenes/in_game_ui.tscn")
var growth_stage = Global.rose_stage
@onready var plant = $RoseAnimation

var flower_name = "Rose - Rosa"
var fact1 = "David Austin developed the most expensive rose - the Juliet Rose"
var fact2 = "Fossil evidence shows that roses were around 35 million years ago."
var fact3 = "The oldest living rose is 1,000 years old in Germany"

#This function is called every time the scene is loaded
func _ready():
	#this sets the plants level to the current level progress.
	plant.frame = growth_stage
	
#This function is called every time the 'grow timer' runs out
func _on_grow_timer_timeout():
	#this checks the current plants level then increass the level by 1 and
	#sets the apearance of the flower to its new level.
	if Global.rose_daily_water == false:
		if plant.frame == 0:
			plant.frame = 1
			Global.rose_stage = 1
			$GrowTimer.stop()
		elif plant.frame == 1:
			plant.frame = 2
			Global.rose_stage = 2
			$GrowTimer.stop()
		elif plant.frame == 2:
			plant.frame = 3
			Global.rose_stage= 3
			$GrowTimer.stop()
		elif plant.frame == 3:
			plant.frame = 4
			Global.rose_stage = 4
			$GrowTimer.stop()
		elif plant.frame == 4:
			plant.frame = 5
			Global.rose_stage = 5
		Global.rose_daily_water = true

#This function runs when the player interacts with the plant
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		#If the player has a watering can then it starts the growth timer and runs
		#the growth animation
		Global.rose_interaction = true
		if Global.watercan == true:
			$GrowTimer.start()
			$RoseAnimation.play("RoseGrowth")
		#This allows the fact viewer to be set as visible on the HUD
		Global.fact_view = true
		give_facts()
			
#his function checks the current plant level before sending any unlocked
#facts to the fact viewer for the player to see
func give_facts():
	if  Global.rose_stage > 1:
			Global.fact_name = flower_name
	if  Global.rose_stage > 2:
			Global.fact_one = fact1
	if  Global.rose_stage > 3:
			Global.fact_two = fact2
	if  Global.rose_stage > 4:
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
		Global.rose_interaction = false
		Global.fact_view = false
		clear_facts()
		
