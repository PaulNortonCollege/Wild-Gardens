extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_pressed():
	Global._reset_global_variables()
	get_tree().change_scene_to_file("res://Scenes/grassland.tscn")
	


func _on_load_game_pressed():
	Global.load_game()


func _on_quit_game_pressed():
	get_tree().quit()
