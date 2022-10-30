extends "res://Script/shape.gd"

var AwalSun = 500
var AwalMoon = 500
var lamaHujan = 10


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var xCenter
var yCenter
var size
 
var i = 45

func hujan(xStart, yStart, increment) :
	lineDDA(xStart, yStart, xStart, yStart + increment, Color.yellow)
	lineDDA(xStart  + 50, yStart, xStart  + 50, yStart + increment, Color.yellow)
	lineDDA(xStart  + 100, yStart, xStart  + 100, yStart + increment, Color.yellow)
	lineDDA(xStart  + 150, yStart, xStart  + 150, yStart + increment, Color.yellow)
	
func bintang(xCenter, yCenter, size):
	var titik1 
	var titik2
	var titik3 
	var titik4
	var titik5
	var titik6
	var titik7
	var titik8
	titik1 =  [xCenter, yCenter - size/2] #atas
	titik2 = [xCenter + size/2, yCenter] #kanan
	titik3 = [xCenter, yCenter + size/2] #bawah
	titik4 =  [xCenter - size/2, yCenter] #kiri
	titik5 = rotation(titik1,[xCenter,yCenter], 45)
	titik6 = rotation(titik2,[xCenter,yCenter], 45)
	titik7 = rotation(titik3,[xCenter,yCenter], 45)
	titik8 = rotation(titik4,[xCenter,yCenter], 45)
	
	titik1 = rotation(titik1,[xCenter,yCenter], i)
	lineDDA(xCenter, yCenter, titik1[0],titik1[1], Color.yellow)
	titik2 = rotation(titik2,[xCenter,yCenter], i)
	lineDDA(xCenter, yCenter, titik2[0] , titik2[1], Color.yellow)
	titik3 = rotation(titik3,[xCenter,yCenter], i)
	lineDDA(xCenter, yCenter, titik3[0], titik3[1], Color.yellow)
	titik4 = rotation(titik4,[xCenter,yCenter], i)
	lineDDA(xCenter, yCenter,titik4[0], titik4[1], Color.yellow)
	titik5 = rotation(titik4,[xCenter,yCenter], i)	
	lineDDA(xCenter, yCenter,titik5[0], titik5[1], Color.yellow)	
	titik6 = rotation(titik6,[xCenter,yCenter], i)
	lineDDA(xCenter, yCenter,titik6[0], titik6[1], Color.yellow)
	titik7 = rotation(titik7,[xCenter,yCenter], i)
	lineDDA(xCenter, yCenter,titik7[0], titik7[1], Color.yellow)
	titik8 = rotation(titik8,[xCenter,yCenter], i)
	lineDDA(xCenter, yCenter,titik8[0], titik8[1], Color.yellow)
	
func _draw():
	pass
	matahari(AwalSun,200, 60)
	#sabit([AwalMoon, 200], 90)
	awan (340,200, 50)
	awan (590,200, 50)
	bintang (100,50, 30)
	bintang (300,120, 30)
	bintang (70,200, 30)
	bintang (210,250, 30)
	bintang (700,50, 30)
	bintang (850,120, 30)
	bintang (970,200, 30)
	bintang (710,250, 30)
	hujan (310, 300, 100)
	hujan (570, 300, 100)
	

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://Scene/Main.tscn")
