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
func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func Dash_dash(xa, ya, xb, yb, color):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var tampung
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	put_pixel(round(x), round(y), color)
	
	for k in steps:
		if(k % 5 == 0):
			x += 5
		x += xIncrement
		y += yIncrement
		put_pixel(round(x), round(y), color)
		
func point_dash(xa, ya, xb, yb, color):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var tampung
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = round(dx/ float(steps))
	yIncrement = round(dy/ float(steps))
	put_pixel(round(x), round(y), color)
	
	for k in steps:
		if(int(x) % 10 == 0):
			x+= 4
			tampung = x
		#if(int(x) % 2 == 4):
			#x+= 20
		if(x == tampung + 2):
			x+= 4
		x += xIncrement
		y += yIncrement
		put_pixel(round(x), round(y), color)

func Point_point(xa, ya, xb, yb, color):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var tampung
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	put_pixel(round(x), round(y), color)
	
	for k in steps:
		if(k % 2 == 0):
			x += 10
		x += xIncrement
		y += yIncrement
		put_pixel(round(x), round(y), color)
