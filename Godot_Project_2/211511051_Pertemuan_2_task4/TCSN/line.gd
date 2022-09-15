extends "res://TCSN/primitif.gd"

var warna = Color( 0, 1, 1, 1 )
var windowSizeX = OS.get_window_size().x
var windowSizeY = OS.get_window_size().y
var titikTengah = Vector2(windowSizeX/2,windowSizeY/2)

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
	


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func fungsi_linear(m,c): 
	pass

	var xa # x = 0
	var ya # y = 0
	var xb
	var yb
	
	xa = titikTengah.x
	ya = titikTengah.y-c
	while ((xa <= windowSizeX-10) && (xa >= 10) &&
	(ya <= windowSizeY-10) && (ya >= 10)): # steps = 20
		xa += gradientFinderX(m)
		ya -= gradientFinderY(m)
		
	xb = titikTengah.x
	yb = titikTengah.y-c
	while ((xb <= windowSizeX-10) && (xb >= 10) &&
	(yb <= windowSizeY-10) && (yb >= 10)): # steps = 20
		xb -= gradientFinderX(m)+c
		yb += gradientFinderY(m)+c
	lineDDA(xa,ya,xb,yb, Color(1,1,1,1))	

func fungsi_kuadrat(a,b,c):
	var x = 0
	var y = 0
	pass
	# ax^2 + bx + c
	# a = gradien; b = variabel; c = konstanta
	while (((x+10 <= windowSizeX-10) && (x+10 >= 10)) && (titikTengah.y-y >= 10)):
		y = (a*x*x)-(b*x)+c
		put_pixel(titikTengah.x-x,titikTengah.y-y,Color(1,1,1,1))
		x = x+0.01
	
	x = 0
	y = 0
	while (((x+10 <= windowSizeX-10) && (x+10 >= 10)) && (titikTengah.y-y >= 10)):
		y = (a*x*x)-(b*x)+c
		put_pixel(titikTengah.x+x,titikTengah.y-y,Color(1,1,1,1))
		x = x+0.01

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
	
func gradientFinderX(m) -> float:
	# trace: m = 0,5
	var precisionValue = 1000000000
	var gcd = (ceil(m)-m)*precisionValue # gcd = 500000000
	
	pass
	if int(m): return 1.0
	else:
		return precisionValue/gcd # return 2

func gradientFinderY(m) -> float:
	
	if int(m):
		return m
	
	else :
		var precisionValue = 1000000000
		var intValue = floor(m) # m = 0
		var gcd = (ceil(m)-m)*precisionValue # gcd = 500000000
		var denominator = precisionValue/gcd # denominator = 2 
		var numerator = ((ceil(m)-m)*precisionValue)/gcd
		return (intValue*denominator)+numerator # return 1
