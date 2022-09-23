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
func lineDDA(xa : float, ya : float, xb : float, yb : float):
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
	
	for k in steps:
		x += xIncrement
		y += yIncrement
		res.append(Vector2(round(x), round(y)))
	#Dipanggil agar garis tampil
	put_pixel_all(res, color)
	return res


#Line_Bresenham
func lineBres(xa, ya, xb, yb):
	var dx = abs(xa - xb)
	var dy = abs(ya - yb)
	var p = 2 * dy - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy - dx)
	var x
	var y
	var xEnd
	var k = 1
	var res = PoolVector2Array()
	
	if xa > xb : 
		x = xb
		y = yb
		xEnd = xa
	else : 
		x = xa
		y = ya
		xEnd = xb
	
	res.append(Vector2(round(x), round(y)))
	
	while x < xEnd :
		x += 1
		if p < 0 :
			p += twoDy
		else : 
			y += 1
			p += twoDyDx
		res.append(Vector2(round(x), round(y)))
		k += 1
	#Dipanggil agar garis tampil
	put_pixel_all(res, color)
	return res



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
			if(x >= xb):
				break
			print(k)
	elif(xa == xb)	:
		for k in steps :
			if(k % 5 == 0):
				y += 5
			y += yIncrement
			res.append(Vector2(round(x), round(y)))	
			if(x >= xb && y >= yb):
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
			if(x >= xb && y >= yb):
				break
			print(k)
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
			if(x >= xb && y >= yb):
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
			if(x >= xb && y >= yb):
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
			if(x >= xb && y >= yb):
				break
			print(k)
	elif(xa == xb)	:
		for k in steps :
			if(k % 2 == 0):
				y += 5
			y += yIncrement
			res.append(Vector2(round(x), round(y)))	
			if(x >= xb && y >= yb):
				break
			print(k)
		
	#Dipanggil agar garis tampil
	put_pixel_all(res, color)
	return res
	
func bold(xa : float, ya : float, xb : float, yb : float):
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
	for i in steps:
		x += xIncrement #11
		y += yIncrement #10
		res.append(Vector2(round(x), round(y)))
		for n in 4:
			if dx > dy:
				res.append(Vector2(round(x), round(y+n)))
			else:
				res.append(Vector2(round(x+n), round(y)))
				
	#Dipanggil agar garis tampil
	put_pixel_all(res, color)
	return res			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

