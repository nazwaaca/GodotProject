extends "res://TCSN/line.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var value = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	value -= 3 * delta;
	update()

func _draw():
	frame()
	kartesian()
	fungsi_trigonometri('sin', value, Color(1,1,1,1))
	fungsi_trigonometri('cos', value, Color(1,1,1,1))
	fungsi_trigonometri('tan', value, Color(1,1,1,1))


func _on_Button_pressed():
	get_tree().change_scene('res://TCSN/line_menu.tscn')
