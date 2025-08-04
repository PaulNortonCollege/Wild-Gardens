extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		Global.player_load_posx = -10
		Global.player_load_posy = 200
		Global.rose_daily_water = false
		Global.bluebell_daily_water = false
		Global.tulip_daily_water = false
		Global.day += 1
		get_tree().reload_current_scene()
		
		
