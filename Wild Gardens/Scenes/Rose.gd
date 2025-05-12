extends StaticBody2D

var growth_stage = Global.rose_stage
@onready var plant = $RoseAnimation

var flower_name = "Rose - Rosa"
var fact1 = "David Austin developed the most expensive rose - the Juliet Rose"
var fact2 = "Fossil evidence shows that roses were around 35 million years ago."
var fact3 = "The oldest living rose is 1,000 years old in Germany"

func _ready():
	plant.frame = growth_stage
	
	
func _on_area_2d_area_entered(area):
	if Global.watercan == true:
		$GrowTimer.start()
		$RoseAnimation.play("RoseGrowth")
		


func _on_grow_timer_timeout():
	
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

		 # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Global.fact_view = true
		give_facts()
			
		
func give_facts():
	if  Global.rose_stage > 1:
			Global.fact_name = flower_name
	if  Global.rose_stage > 2:
		#Global.fact_name = flower_name
		Global.fact_one = fact1
	if  Global.rose_stage > 3:
		#Global.fact_name = flower_name
		#Global.fact_one = fact1
		Global.fact_two = fact2
	if  Global.rose_stage > 4:
		#Global.fact_name = flower_name
		#Global.fact_one = fact1
		#Global.fact_two = fact2
		Global.fact_three = fact3


func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		Global.fact_view = false
		
