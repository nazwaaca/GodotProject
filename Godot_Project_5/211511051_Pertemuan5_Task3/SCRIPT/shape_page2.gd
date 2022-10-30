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
	trapesium_siku_siku(Vector2(50,50), 200, 150, 250)
	jajargenjang(Vector2(750,400), 200, 150, 50)
	#ketupat(Vector2(250,350), 200)
	ketupat([200,450], 200)
	layanglayang(Vector2(850,50), 200, 150)


func _on_Button4_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/shape_page1.tscn")


func _on_Button3_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/shape_page3.tscn")
