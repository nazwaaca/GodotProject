extends 'res://TCSN/line.gd'
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
	frame()
	kartesian()
	#isi_var()
#	y = 2x + 3
	fungsi_linear(10,10)
	fungsi_kuadrat(2, 4, 7)
	fungsi_trigonometri("sin", 30, Color(1,1,1,1))
	fungsi_trigonometri("cos", 30, Color(1,1,1,1))
	fungsi_trigonometri("tan", 30, Color(1,1,1,1))


 



func _on_Button_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/line_menu.tscn")
