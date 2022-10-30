extends "primitif.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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
	return result

func translation(a:Array, b:Array):
	var result = tambahMatriks(a,b)
	return result

func panjangVektor(a:Array, b:Array):
	pass
	return sqrt(pow(a[0]-b[0],2)+pow(a[1]-b[1],2))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
