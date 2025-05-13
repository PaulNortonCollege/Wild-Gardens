extends Node2D


func _ready():

	$Player.position.x = Global.player_load_posx
	$Player.position.y = Global.player_load_posy
	
	
		

	$Rose/RoseAnimation.frame = Global.rose_stage
	
func _physics_process(delta):
	if Global.fact_view == true:
		$CanvasLayer/FactSheet.visible = true
	else:
		$CanvasLayer/FactSheet.visible = false

func _on_forest_enter_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/forest.tscn")
