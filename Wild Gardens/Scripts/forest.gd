extends Node2D



func _on_grassland_enter_body_entered(body):
	if body.is_in_group("Player"):
		Global.player_load_posx = 152
		Global.player_load_posy = -55
		get_tree().change_scene_to_file("res://Scenes/grassland.tscn")
		
