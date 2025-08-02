extends HBoxContainer

@onready var day_display = $DayLabel
@onready var star_display = $StarsLabel



# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var days: String = str(Global.day)
	var stars: String = str(Global.stars_found)
	day_display.text = ("Day " + days)
	star_display.text = ("Stars Found: " + stars)
	update_text()
	
func update_text():
	pass
	
