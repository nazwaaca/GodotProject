extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#	pass
var color = Color(1,1,1,1)
#put_pixel
func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())
		
func buatTitik(a:Array,color):
	pass
	put_pixel(a[0],a[1],color)


#Task 1 : Operasi Matrix
#Tambahkan primitif.gd memiliki fungsi operasi matrix Tambah, Kurang, Kali, Matrix Identitas
func tambahMatriks (a:Array, b:Array):
	pass
	var result = [0,0]
	result[0] = a[0] + b[0]
	result[1] = a[1] + b[1]
	#print(result)
	return result

func kurangMatriks (a:Array, b:Array):
	pass
	var result = [0,0]
	result[0] = a[0] - b[0]
	result[1] = a[1] - b[1]
	#print(result)
	return result

func kaliMatriks (a:Array, b:Array):
	pass
	var result
	
	result = [a[0][0]*b[0]+a[0][1]*b[1], a[1][0]*b[0]+a[1][1]*b[1]]
	#print(result)
	return result

func matriksIdentitas():
	pass
	var result = [[1,0],[0,1]]
	print(result)
	return result

	
#Task 2 : Operasi Matrix
#Buatlah gdscript (primitif.gd) memiliki fungsi-fungsi berikut: scale, rotation, translation
func scale(titik:Array, center:Array, scaleVar):
	var result
	result = kurangMatriks(titik, center)
	result = kaliMatriks(result,scaleVar)
	result = tambahMatriks(result, center)
	return result

func rotationIdentity(deg):
	var result = [[cos(deg2rad(deg)),-sin(deg2rad(deg))],
	[sin(deg2rad(deg)),cos(deg2rad(deg))]]
	return result

func rotation(titik:Array, center:Array, deg):
	var result
	result = kurangMatriks(titik, center)
	result = kaliMatriks(rotationIdentity(deg),result)
	result = tambahMatriks(result,center)
	print(result)
	return result

func translation(a:Array, b:Array):
	var result = tambahMatriks(a,b)
	return result

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
		
	xIncrement = dx/float(steps)
	yIncrement = dy/float(steps)
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
			#print(k)
	elif(xa == xb)	:
		for k in steps :
			if(k % 5 == 0):
				y += 5
			y += yIncrement
			res.append(Vector2(round(x), round(y)))	
			if(x >= xb && y >= yb):
				break
			#print(k)
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
			#print(k)
	
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
			#print(k)
		
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
