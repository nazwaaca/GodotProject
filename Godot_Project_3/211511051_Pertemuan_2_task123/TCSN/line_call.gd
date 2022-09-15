#extends Node2D
extends "res://TCSN/primitif.gd"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var warna = Color( 0, 1, 1, 1 )


#Cek ukuran layar
#func isi_var():
	#print(get_viewport().size.y)
	#print(get_viewport().size.x)

#Saya membuat frame dengan margin 10
func frame():
	#Garis horizontal
	lineBres(10, 10, get_viewport().size.x-10, 10, warna)
	lineBres(10, get_viewport().size.y-10, get_viewport().size.x-10, get_viewport().size.y-10, warna)
	
	#Garis vertikal
	lineDDA(10, 10, 10, get_viewport().size.y-10, warna )
	lineDDA(get_viewport().size.x-10, 10, get_viewport().size.x-10, get_viewport().size.y-10, warna )

func kartesian():
	lineBres(10, get_viewport().size.y/2, get_viewport().size.x-10, get_viewport().size.y/2, warna)
	lineDDA(get_viewport().size.x/2, 10, get_viewport().size.x/2, get_viewport().size.y-10, warna)
	
func fungsi_linear(x_koef, konstanta, color):
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	# x = 0 // titik tengah
	var x = width/2
	# y = 0 // titik tengah
	var y = height/2 
	
	var x_kebawah
	var y_kebawah

	#Selama di dalam frame
	while (x >= 10 && y < (height-10) && x < width-10 && y > 10):

		x += 0.01
		y = height/2 + (width/2 - x) * x_koef - konstanta
		put_pixel(x, y, color)
	

		x_kebawah = (width/2) - (x - width/2)
		y_kebawah = height/2 + (width/2 - x_kebawah) * x_koef - konstanta 
		put_pixel(x_kebawah, y_kebawah, color)
	
func fungsi_kuadrat(x_koef, konstanta, color): 
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	var y = pow(x_koef,2) + (3 * x_koef) + konstanta
	
	x_koef = x_koef - 30
	
	while (x_koef < 30):
		put_pixel(width/2 + x_koef, height/2 - y, color)
		x_koef+= 0.01
		y = pow(x_koef,2) + (3 * x_koef) + konstanta
		

func fungsi_trigonometri(tipe ,x, colors):
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	var xa = 10
	var ya = (width-10)/2
	var y; var xb; var yb; 
	
	while (xa >= 10 && ya < (height-10) && xa < width-10 && ya > 10):
		if tipe == "cos":
			y = height/2 - (cos(x) * 40)
			xb = xa + 1
			yb = y
			lineBres(xa,ya,xb,yb,colors)
			x = x + 0.01
			xa = xb
			ya = yb
		elif tipe == "sin":
			y = height/2 - (sin(x) * 40)
			xb = xa + 1
			yb = y
			lineBres(xa,ya,xb,yb,colors)
			x = x + 0.01
			xa = xb
			ya = yb
		elif tipe == "tan":
			y = height/2 - (tan(x) * 40)
			xb = xa + 1
			yb = y
			lineBres(xa,ya,xb,yb,colors)
			x = x + 0.01
			xa = xb
			ya = yb

func _draw():
	frame()
	kartesian()
	#isi_var()
#	y = 2x + 3
	fungsi_linear(8, 4, Color( 0, 0, 1, 1 ))
	fungsi_kuadrat(2, 4, Color( 1, 1, 0.545098, 1 ))
	fungsi_trigonometri("sin",90, warna)
	fungsi_trigonometri("cos",90, warna)
	fungsi_trigonometri("tan",90, warna)
