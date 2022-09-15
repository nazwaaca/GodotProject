extends "res://TCSN/Variant.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _draw():
	Dash_dash(250, 100, 500, 100,Color(1,1,1,1))
	point_dash(250, 200, 550, 200,Color(1,1,1,1))
	Point_point(250, 300, 335, 300,Color(1,1,1,1))


func _on_Button_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/line_menu.tscn")
