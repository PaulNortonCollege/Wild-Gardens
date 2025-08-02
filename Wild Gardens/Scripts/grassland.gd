extends Node2D


func _ready():
	get_tree(). paused = false

	$Player.position.x = Global.player_load_posx
	$Player.position.y = Global.player_load_posy
	
	
		

	$Rose/RoseAnimation.frame = Global.rose_stage
	
#func _physics_process(delta):
	#if Global.fact_view == true:
		#$CanvasLayer/FactSheet.visible = true
	#else:
		#$CanvasLayer/FactSheet.visible = false
func _process(delta):
	Global.player_load_posx = $Player.position.x  
	Global.player_load_posy = $Player.position.y 
	
func _on_forest_enter_body_entered(body):
	if body.is_in_group("Player"):
		Global.player_load_posx = 262
		Global.player_load_posy = 321
		get_tree().change_scene_to_file("res://Scenes/forest.tscn")
		Global.current_scene = 2
		
