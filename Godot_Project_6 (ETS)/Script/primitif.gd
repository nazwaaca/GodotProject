extends Node2D


# Matrik [x,y] = [a, b]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func tambahMatriks (a:Array, b:Array):
	pass
	var result = [0,0]
	result[0] = a[0] + b[0]
	result[1] = a[1] + b[1]
	return result

func kurangMatriks (a:Array, b:Array):
	pass
	var result = [0,0]
	result[0] = a[0] - b[0]
	result[1] = a[1] - b[1]
	return result

func kaliMatriks (a:Array, b:Array):
	pass
	var temp = [[a[0],0],[0,a[1]]]
	var result
	
	result = [a[0][0]*b[0]+a[0][1]*b[1],
	a[1][0]*b[0]+a[1][1]*b[1]]
	return result

func matriksIdentitas():
	pass
	var result = [[1,0],[0,1]]
	return result

func buatTitik(a:Array,color):
	pass
	put_pixel(a[0],a[1],color)

# LINE & PUT_PIXEL
func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x,y)]),
		PoolColorArray([color]),
		PoolVector2Array())
	

func lineDDA(xa,ya,xb,yb,color):
	pass
	var dx = xb-xa
	var dy = yb-ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	
	if (abs(dx) > abs(dy)) : steps = abs(dx)
	else : steps = abs(dy)
	
	xIncrement = dx/steps
	yIncrement = dy/steps
	
	put_pixel(round(x), round(y), color)
	
	for i in steps:
		x += xIncrement
		y += yIncrement
		put_pixel(round(x), round(y), color)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
