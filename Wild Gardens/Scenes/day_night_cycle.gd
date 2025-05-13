extends StaticBody2D

var state = "Night"
var change_state = Global.change_time
var length_day = 30
var length_night = 5

func _ready():
	change_to_day()

#func _on_timer_timeout():
	#if state == "Day":
		#state = "Night"
	#elif state == "Night":
		#state = "Day"
		#
	#change_state = true
	
func _process(delta):
	
	if Global.change_time == true:
		print("change +")
		Global.change_time = false
		print(Global.change_time)
		
		if state == "Day":
			print("check day")
			
			change_to_day()
			
			state = "Night"
		elif state == "Night":
			print("check night")
			
			change_to_night()
			state = "Day"
		
		
			
func change_to_day():
	print("running day")
	$AnimationPlayer.play("Night to Day")
	#$Timer.wait_time = 10
	#$Timer.start

func change_to_night():
	print("running night")
	$AnimationPlayer.play("Day to Night")	
	#$Timer.wait_time = 10
	#$Timer.start
