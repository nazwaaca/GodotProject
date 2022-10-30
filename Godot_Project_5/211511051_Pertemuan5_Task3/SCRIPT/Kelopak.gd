extends "res://SCRIPT/shape.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Kelopak(titikPusat:Array, diagonal, besarKelopak, jumlahkelopak):
	pass
	var putaran = 360/jumlahkelopak
	var titikPutar = [titikPusat[0],titikPusat[1]-diagonal/2] # [50,25]
	var rotationTitikPutar = rotation(titikPutar,titikPusat,putaran) # []
	for i in jumlahkelopak:
		#circleMidPoint(titikPutar[0],titikPutar[1],besarKelopak,Color(1,1,1,1))
		circleMidPoint(titikPutar[0],titikPutar[1],besarKelopak,Color(1,1,1,1))
		titikPutar = rotationTitikPutar
		rotationTitikPutar = rotation(rotationTitikPutar,titikPusat,putaran)
		
func Kelopak1(titikPusat:Array, diagonal, besarKelopak, jumlahkelopak):
	pass
	var res = PoolVector2Array()
	var putaran = 360/jumlahkelopak
	var titikPutar = [titikPusat[0],titikPusat[1]-diagonal/2] # [50,25]
	var rotationTitikPutar = rotation(titikPutar,titikPusat,putaran) # []
	for i in jumlahkelopak:
		res.append_array(lineDDA(titikPutar[0], titikPutar[1], titikPutar[0]  - (diagonal/2), titikPutar[1] + (diagonal/2)))
		res.append_array(lineDDA(titikPutar[0], titikPutar[1], titikPutar[0]  + (diagonal/2), titikPutar[1] + (diagonal/2)))
		res.append_array(lineDDA(titikPutar[0] - (diagonal/2), titikPutar[1] + (diagonal/2), titikPutar[0], titikPutar[1] + diagonal))
		res.append_array(lineDDA(titikPutar[0] + (diagonal/2), titikPutar[1] + (diagonal/2), titikPutar[0], titikPutar[1] + diagonal))
		titikPutar = rotationTitikPutar
		rotationTitikPutar = rotation(rotationTitikPutar,titikPusat,putaran)		
		
