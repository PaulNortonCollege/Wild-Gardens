extends Node2D

func _ready():
	get_tree(). paused = false
	
	$Player.position.x = Global.player_load_posx
	$Player.position.y = Global.player_load_posy
	
func _process(delta):
	Global.player_load_posx = $Player.position.x  
	Global.player_load_posy = $Player.position.y 

func _on_grassland_enter_body_entered(body):
	if body.is_in_group("Player"):
		Global.player_load_posx = 152
		Global.player_load_posy = -55
		get_tree().change_scene_to_file("res://Scenes/grassland.tscn")
		Global.current_scene = 1
		
