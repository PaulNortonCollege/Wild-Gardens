extends StaticBody2D
var current_weather = Global.current_weather

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	current_weather = Global.current_weather
	if current_weather == "Sunny":
		$Rain.visible = false
		$RainColour.visible = false
	if current_weather == "Rain":
		$Rain.visible = true
		$RainColour.visible = true



