extends MarginContainer

@export var menu_screen: VBoxContainer
@export var open_menu_screen: HBoxContainer

func toggle_visability(object):
	var anim = $AnimationPlayer
	var animation_type: String
	if object.visible:
		animation_type = "close_"
		#object.visible = false
	else:
		animation_type = "open_"
		#object.visible = true
	anim.play(animation_type + str(object.name))
# Called when the node enters the scene tree for the first time.



func _on_toggle_menu_button_pressed():
	toggle_visability(menu_screen)
	toggle_visability(open_menu_screen)
	if open_menu_screen.visible == true:	
		get_tree(). paused = true
	else:
		get_tree(). paused = false


func _on_quit_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_save_pressed():

	Global.save_game()


func _on_rules_pressed():
	pass
