extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var name = Global.fact_name
	var fact1 = Global.fact_one
	var fact2 = Global.fact_two
	var fact3 = Global.fact_three
	$Control/MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/Label.text = name

	$Control/MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/VBoxContainer/Label2.text = str(fact1)
	$Control/MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/VBoxContainer/Label3.text = str(fact2)
	$Control/MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/VBoxContainer/Label4.text = str(fact3)
