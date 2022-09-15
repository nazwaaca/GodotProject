extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var color = Color(1,1,1,1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())

func put_pixel_all(dot: PoolVector2Array, color):
	for i in dot.size():
		put_pixel(dot[i].x, dot[i].y, color)


#line_dda
func dash_dash(xa : float, ya : float, xb : float, yb : float):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var res = PoolVector2Array()
	
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	res.append(Vector2(round(x), round(y)))
	if(ya == yb):
		for k in steps :
			if(k % 5 == 0):
				x += 5
			x += xIncrement
			y += yIncrement
			res.append(Vector2(round(x), round(y)))	
			if(k > 95):
				break
			print(k)
	elif(xa == xb)	:
		for k in steps :
			if(k % 5 == 0):
				y += 5
			y += yIncrement
			res.append(Vector2(round(x), round(y)))	
			if(k > 95):
				break
			print(k)
	else:
		for k in steps:
			if(k % 5 == 0):
				x += 3
				y += 3
			x += xIncrement
			y += yIncrement
			put_pixel(round(x), round(y), color)
			if(k > 120):
				break
			print(steps)
	
	#Dipanggil agar garis tampil
	put_pixel_all(res, color)
	return res
	
func point_dash(xa : float, ya : float, xb : float, yb : float):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var res = PoolVector2Array()
	var tampung = 0
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	res.append(Vector2(round(x), round(y)))
	if(ya == yb):
		for k in steps:
			if(int(x) % 10 == 0):
				x+= 4
				tampung = x
			if(x == tampung + 2):
				x+= 4
			x += xIncrement
			y += yIncrement
			res.append(Vector2(round(x), round(y)))
			if(k > 145):
				break
	else :
		for k in steps:
			if(int(y) % 10 == 0):
				y+= 4
				tampung = y
			if(y == tampung + 2):
				y+= 4
			y += yIncrement
			res.append(Vector2(round(x), round(y)))
			if(k > 110):
				break
	#Dipanggil agar garis tampil
	put_pixel_all(res, color)
	return res
	
func point_point(xa : float, ya : float, xb : float, yb : float):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var res = PoolVector2Array()
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	res.append(Vector2(round(x), round(y)))
	
	if(ya == yb):
		for k in steps :
			if(k % 2 == 0):
				x += 5
			x += xIncrement
			y += yIncrement
			res.append(Vector2(round(x), round(y)))	
			if(k > 54):
				break
			print(k)
	elif(xa == xb)	:
		for k in steps :
			if(k % 2 == 0):
				y += 5
			y += yIncrement
			res.append(Vector2(round(x), round(y)))	
			if(k > 54):
				break
			print(k)
		
	#Dipanggil agar garis tampil
	put_pixel_all(res, color)
	return res
	
func persegi(titik_awal: Vector2, panjang_sisi):
	var res = PoolVector2Array()
	point_point(titik_awal.x, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y) #sisi atas
	point_point(titik_awal.x, titik_awal.y + panjang_sisi, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi) #sisi bawah
	point_point(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + panjang_sisi) #sisi kiri
	point_point(titik_awal.x + panjang_sisi, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi) #sisi kanan
	return res

func persegi_panjang(titik_awal: Vector2, panjang, lebar):
	var res = PoolVector2Array()
	point_dash(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y) #sisi atas
	point_dash(titik_awal.x, titik_awal.y + lebar, titik_awal.x + panjang, titik_awal.y + lebar) #sisi bawah
	point_dash(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + lebar) #sisi kiri
	point_dash(titik_awal.x + panjang, titik_awal.y, titik_awal.x + panjang, titik_awal.y + lebar) #sisi kanan
	return res
	
func segitiga_siku_siku(titik_awal: Vector2, alas, tinggi):
	var res = PoolVector2Array()
	dash_dash(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi) #sisi kiri
	dash_dash(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + alas, titik_awal.y + tinggi) #sisi bawah
	dash_dash(titik_awal.x, titik_awal.y, titik_awal.x + alas, titik_awal.y + tinggi) #sisi kanan
	return res
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _draw():
	persegi(Vector2(50,50), 200)
	persegi_panjang(Vector2(350,50),250 , 200)
	segitiga_siku_siku(Vector2(700,50), 200, 200)


func _on_Button3_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/Sub_menu.tscn")
