extends "res://SCRIPT/Kelopak.gd"


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
	var ukuran = 35
	for i in 5 :
		circleMidPoint(get_viewport().size.x/2, get_viewport().size.y/2, ukuran, Color(1,1,0,1))
		ukuran = ukuran - 5
		
	Kelopak([get_viewport().size.x/2, get_viewport().size.y/2],100, 50, 8)
	Kelopak1([get_viewport().size.x/2, get_viewport().size.y/2 - 50],100, 10, 8)


func _on_Button3_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/4 Kelopak.tscn")

func _on_Button_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/Main.tscn")
