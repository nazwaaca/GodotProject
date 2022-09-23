extends 'res://SCRIPT/shape.gd'


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func elips2D():
	var i = 0
	var l = 10
	var color = Color(0.501961, 0, 0, 1)
	ellipseMidPoint(get_viewport().size.x/2, get_viewport().size.y/2, 200, 90, color)
	ellipseMidPoint(get_viewport().size.x/2, get_viewport().size.y/2, 90, 200, color)
	while (i <= 10):
		if (i == 2):
			color = Color( 0.545098, 0, 0, 1 )
		elif(i == 4):
			color = Color( 0.698039, 0.133333, 0.133333, 1 )
		elif(i == 6):
			color = Color( 1, 0, 0, 1 )
		elif(i == 8):
			color = Color( 0.941176, 0.501961, 0.501961, 1 )
		ellipseMidPoint(get_viewport().size.x/2+l, get_viewport().size.y/2, 200, 90, color)
		ellipseMidPoint(get_viewport().size.x/2-l, get_viewport().size.y/2, 200, 90, color)
		ellipseMidPoint(get_viewport().size.x/2, get_viewport().size.y/2-l, 90, 200, color)
		ellipseMidPoint(get_viewport().size.x/2, get_viewport().size.y/2+l, 90, 200, color)
		l = l + 10
		i = i + 1

func _draw():
	elips2D()


func _on_Button_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/Main.tscn")

