extends 'res://SCRIPT/shape.gd'
func _ready():
	pass # Replace with function body.


func lingkaran_overlapping():
	var x = 170
	var y = 150
	var i = 0
	while (i<5):
		lingkaran_horizontal(x, y)
		y = y + 70
		i = i + 1
	#lingkaran_horizontal(x, y+70)
	#lingkaran_horizontal(x, y+140)
	#lingkaran_horizontal(x, y+210)
	#lingkaran_horizontal(x, y+280)
func lingkaran_horizontal(x, y):
	var i = 0
	
	while (i < 9) :
		x = x + 70
		circleMidPoint(x, y, 50, Color(0.5,1,0.4,1))	
		i = i + 1
	
	
func _draw():
	lingkaran_overlapping()


func _on_Button_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/Main.tscn")
