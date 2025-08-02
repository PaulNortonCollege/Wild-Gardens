extends MarginContainer


var watercan_notified = false
# Called when the node enters the scene tree for the first time.
#var tween : Tween =
func _ready():
	watercan_notified = Global.watercan_notified
	note_area()
	note_day()
	
	$Timer.start()
	
func _process(delta):

	note_watercan()
	note_rose()

func note_rose():
	var rose_interaction  = Global.rose_interaction
	if rose_interaction == true and Global.rose_stage > 4:

		$notifyPlayer.text = "This rose is perfect!"
	elif Global.watercan == false and rose_interaction == true:

		$notifyPlayer.text = "To water this plant you will need to find a watering can!"	
	elif Global.watercan == true and rose_interaction == true:

		$notifyPlayer.text = "You have watered this rose!"
	


func note_watercan():	
	if Global.watercan == true and watercan_notified == false:
		$notifyPlayer.text = "A watering can has been found!"
		Global.watercan_notified = true
		watercan_notified = true
	$Note_timer.start()

func note_area():
	if Global.current_scene == 1:
		$AreaLabel.text = "Grasslands"
	elif Global.current_scene == 2:
		$AreaLabel.text = "Forest"

func note_day():
	var days: String = str(Global.day)
	$DayCount.text = ("Day "+days)
	


func _on_timer_timeout():
	$AreaLabel.text = ""
	$DayCount.text = ""
	$notifyPlayer.text = ""
	


func _on_note_timer_timeout():
	$notifyPlayer.text = ""
