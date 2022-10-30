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
	persegi(Vector2(50,50), 200)
	persegi_panjang(Vector2(350,50),250 , 200)
	segitiga_siku_siku(Vector2(700,50), 200, 200)

func _on_Button_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/Main.tscn")


func _on_Button3_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/shape_page2.tscn")
