extends "res://SCRIPT/shape.gd"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _draw():
	segiLima([get_viewport().size.x/2 - 200, get_viewport().size.y/2 - 100], 200)
	segiEnam([get_viewport().size.x/2 + 200, get_viewport().size.y/2 - 100], 200)

	
func _on_Button4_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/shape_page2.tscn")
	
func _on_Button_pressed():
	get_tree().change_scene("res://TCSN/Main.tscn")
