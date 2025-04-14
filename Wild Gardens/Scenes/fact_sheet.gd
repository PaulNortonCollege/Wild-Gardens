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
	
	$ColorRect/FlowerName.text = name
	$ColorRect/FactOne.text = str(fact1)
	$ColorRect/FactTwo.text = str(fact2)
	$ColorRect/FactThree.text = str(fact3)
