extends "res://TCSN/line.gd"
var titikX = 0
var titikY = 0
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
	var titikX = 0
	var titikY = 0
	pass
	# ax^2 + bx + c
	# a = gradien; b = variabel; c = konstanta
	while (((titikX+10 <= windowSizeX-10) && (titikX+24 >= 10)) && 
	(titikTengah.y-titikY >= titikTengah.y-limit)):
		titikY = (a*titikX*titikX)-(b*titikX)+c
		put_pixel(titikTengah.x-titikX,titikTengah.y-titikY,Color(1,1,1,1))
		
		titikX = titikX+0.01
	
	titikX = 0
	titikY = 0
	while (((titikX+10 <= windowSizeX-10) && (titikX+10 >= 10)) &&
	(titikTengah.y-titikY >= titikTengah.y-limit)):
		
		titikY = (a*titikX*titikX)-(b*titikX)+c
		put_pixel(titikTengah.x+titikX,titikTengah.y-titikY,Color(1,1,1,1))
		titikX = titikX+0.01

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
