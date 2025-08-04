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
	note_bluebell()
	note_tulip()

func note_rose():
	var rose_interaction  = Global.rose_interaction
	if rose_interaction == true and  Global.rose_daily_water == false:
		if rose_interaction == true and Global.rose_stage > 4:
			$notifyPlayer.text = "This rose is perfect!"
		elif Global.watercan == false and rose_interaction == true:
			$notifyPlayer.text = "To water this plant you will need to find a watering can!"	
		elif Global.watercan == true and rose_interaction == true:
			$notifyPlayer.text = "You have watered this rose!"
	elif rose_interaction == true and Global.rose_daily_water == true:
		$notifyPlayer.text = "You have watered this rose already"
	
func note_bluebell():
	var bluebell_interaction  = Global.bluebell_interaction
	if bluebell_interaction == true and  Global.bluebell_daily_water == false:
		if bluebell_interaction == true and Global.bluebell_stage > 4:
			$notifyPlayer.text = "This bluebell is perfect!"
		elif Global.watercan == false and bluebell_interaction == true:
			$notifyPlayer.text = "To water this plant you will need to find a watering can!"	
		elif Global.watercan == true and bluebell_interaction == true:
			$notifyPlayer.text = "You have watered this bluebell!"
	elif bluebell_interaction == true and Global.bluebell_daily_water == true:
		$notifyPlayer.text = "You have watered this bluebell already"
		
func note_tulip():
	var tulip_interaction  = Global.tulip_interaction
	if tulip_interaction == true and  Global.tulip_daily_water == false:
		if tulip_interaction == true and Global.tulip_stage > 4:
			$notifyPlayer.text = "This tulip is perfect!"
		elif Global.watercan == false and tulip_interaction == true:
			$notifyPlayer.text = "To water this plant you will need to find a watering can!"	
		elif Global.watercan == true and tulip_interaction == true:
			$notifyPlayer.text = "You have watered this tulip!"
	elif tulip_interaction == true and Global.tulip_daily_water == true:
		$notifyPlayer.text = "You have watered this tulip already"
	

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
