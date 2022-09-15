extends "res://TCSN/line.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var limit = titikTengah.y
var limit2 = titikTengah.y

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	pass
	limit = limit-1
	if (titikTengah.y+limit == 10):
		limit = 0
	limit2 = limit2+1
	if (titikTengah.y+limit2 == 10):
		limit = 0
	
	
	update()

func fungsi_linear(m,c):
	pass

	var xa # titikX = 0
	var ya # titikY = 0
	var xb
	var yb
	
	xa = titikTengah.x
	ya = titikTengah.y-c
	while ((xa <= windowSizeX-10) && (xa >= 10) && (ya >= limit)): # steps = 20
		xa += gradientFinderX(m)
		ya -= gradientFinderY(m)
		print ("titik xa ", xa, " titik ya ", ya)
		put_pixel(xa,ya,Color(1,1,1,1))
		
	xb = titikTengah.x
	yb = titikTengah.y-c
	while ((xb <= windowSizeX-10) && (xb >= 10) && (yb <= limit2)): # steps = 20
		xb -= gradientFinderX(m)+c
		yb += gradientFinderY(m)+c
		put_pixel(xb,yb,Color(1,1,1,1))
		
func _draw():
	frame()
	kartesian()
	fungsi_linear(1,0)


func _on_Button_pressed():
	get_tree().change_scene("res://TCSN/KuadratAnimasi.tscn")
