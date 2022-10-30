extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#put_pixel
func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())

#Task 1 : Operasi Matrix
#Tambahkan primitif.gd memiliki fungsi operasi matrix Tambah, Kurang, Kali, Matrix Identitas
func tambahMatriks (a:Array, b:Array):
	pass
	var result = [0,0]
	result[0] = a[0] + b[0]
	result[1] = a[1] + b[1]
	print(result)
	return result

func kurangMatriks (a:Array, b:Array):
	pass
	var result = [0,0]
	result[0] = a[0] - b[0]
	result[1] = a[1] - b[1]
	print(result)
	return result

func kaliMatriks (a:Array, b:Array):
	pass
	var result
	
	result = [a[0][0]*b[0]+a[0][1]*b[1], a[1][0]*b[0]+a[1][1]*b[1]]
	print(result)
	return result

func matriksIdentitas():
	pass
	var result = [[1,0],[0,1]]
	print(result)
	return result

#line_dda
func lineDDA(xa, ya, xb, yb, color):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	put_pixel(round(x), round(y), color)
	
	for k in steps:
		x += xIncrement
		y += yIncrement
		put_pixel(round(x), round(y), color)


#Line_Bresenham
func lineBres(xa, ya, xb, yb, color):
	var dx = abs(xa - xb)
	var dy = abs(ya - yb)
	var p = 2 * dy - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy - dx)
	var x
	var y
	var xEnd
	
	if xa > xb : 
		x = xb
		y = yb
		xEnd = xa
	else : 
		x = xa
		y = ya
		xEnd = xb
	
	put_pixel(x, y, color)
	
	while x < xEnd :
		x += 1
		if p < 0 :
			p += twoDy
		else : 
			y += 1
			p += twoDyDx
		put_pixel(x, y, color)
			

