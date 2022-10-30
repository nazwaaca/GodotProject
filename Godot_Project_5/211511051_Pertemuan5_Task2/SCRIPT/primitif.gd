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
	
	
#Task 2 : Operasi Matrix
#Buatlah gdscript (primitif.gd) memiliki fungsi-fungsi berikut: scale, rotation, translation
var Matrix3x3 = [[0,0,0],[0,0,0],[0,0,0]]

func scale(sx: float, sy: float, ref_p: Vector2):
	var m = matrix3x3SetIdentity()
	m[0][0] = sx
	m[0][2] = (1-sx)*ref_p.x
	m[1][1] = sy
	m[1][2] = (1-sy)*ref_p.y
	Matrix3x3 = multiplyMatrix3x3(m, Matrix3x3)

func rotation(a: float, ref_p: Vector2):
	var m = matrix3x3SetIdentity()
	a = deg2rad(a)
	m[0][0] = cos(a)
	m[0][1] = -sin(a)
	m[0][2] = ref_p.x*(1-cos(a)) + ref_p.y*sin(a)
	m[1][0] = sin(a)
	m[1][1] = cos(a)
	m[1][2] = ref_p.y*(1-cos(a)) - ref_p.x*sin(a)
	Matrix3x3 = multiplyMatrix3x3(m, Matrix3x3) 

func translation(sx: int, sy: int):
	var m = matrix3x3SetIdentity()
	m[0][2] = sx
	m[1][2] = sy
	Matrix3x3 = multiplyMatrix3x3(m, Matrix3x3) 
	
func transformPoints2(nPts: int, pts: PoolVector2Array):
	var temp
	for i in range(pts.size()):
		temp = Matrix3x3[0][0] * pts[i].x + Matrix3x3[0][1] * pts[i].y + Matrix3x3[0][2]
		pts[i].y = Matrix3x3[1][0] * pts[i].x + Matrix3x3[1][1] * pts[i].y + Matrix3x3[1][2]
		pts[i].x = temp
	return pts
	
func matrix3x3SetIdentity():
	var m = [[0,0,0], [0,0,0], [0,0,0]]
	for i in range(3):
		for j in range(3):
			if i == j:
				m[i][j] = 1
	print(m)
	
func multiplyMatrix3x3(m1,m2):
	var temp = [[0,0,0],[0,0,0],[0,0,0]]
	for r in range(3):
		for c in range(3):
			temp[r][c] = m1[r][0]*m2[0][c] + m1[r][1]*m2[1][c] + m1[r][2]*m2[2][c]
	print(temp)
	return temp


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
			

