extends "res://TCSN/line.gd"
var x = 0
var y = 0
var limit = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	pass
	limit = limit+1
	if (titikTengah.y-limit == 24):
		limit = 0
	update()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fungsi_kuadrat(a,b,c):
	var x = 0
	var y = 0
	pass
	# ax^2 + bx + c
	# a = gradien; b = variabel; c = konstanta
	while (((x+10 <= windowSizeX-10) && (x+24 >= 10)) && 
	(titikTengah.y-y >= titikTengah.y-limit)):
		y = (a*x*x)-(b*x)+c
		put_pixel(titikTengah.x-x,titikTengah.y-y,Color(1,1,1,1))
		
		x = x+0.01
	
	x = 0
	y = 0
	while (((x+10 <= windowSizeX-10) && (x+10 >= 10)) &&
	(titikTengah.y-y >= titikTengah.y-limit)):
		
		y = (a*x*x)-(b*x)+c
		put_pixel(titikTengah.x+x,titikTengah.y-y,Color(1,1,1,1))
		x = x+0.01

func _draw():
	pass
	frame()
	kartesian()
	fungsi_kuadrat(1,0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://TCSN/TrigonometriAnimasi.tscn")
