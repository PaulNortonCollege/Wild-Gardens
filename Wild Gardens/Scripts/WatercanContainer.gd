extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.watercan == false:
		$NinePatchRect/MarginContainer/WatercanImage.visible = false
	else:
		$NinePatchRect/MarginContainer/WatercanImage.visible = true
