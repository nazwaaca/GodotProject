extends "matrix.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func ketupat(titikPusat:Array, diagonal, rotate,color):
	#[50,50] 50
	pass
	var titikKetupat = [titikPusat[0],titikPusat[1]-diagonal/2] # [50,25]
	titikKetupat = rotation(titikKetupat,titikPusat,rotate)
	var rotationTitikKetupat = rotation(titikKetupat,titikPusat,90) # []
	for i in 4:
		lineDDA(titikKetupat[0],titikKetupat[1],
		rotationTitikKetupat[0],rotationTitikKetupat[1],color)
		titikKetupat = rotationTitikKetupat
		rotationTitikKetupat = rotation(rotationTitikKetupat,titikPusat,90)

func JajarGenjang(pusat:Array, panjang):
	pass
	var titikPusat = pusat
	var titik1 = [titikPusat[0]-panjang/2, titikPusat[1]-panjang/2]
	var titik2 = rotation(titik1,titikPusat,90)
	#lineDDA(titik1[0],titik1[1],titik2[0],titik2[1])
	var titik3 = translation(rotation(titik1,titikPusat,-90),[panjang/4,0])
	#lineDDA(titik3[0],titik3[1],titik1[0],titik1[1])
	titik1 = titik2
	titik2 = translation(rotation(titik1,titikPusat,90),[panjang/4,0])
	#lineDDA(titik1[0],titik1[1],titik2[0],titik2[1])
	#lineDDA(titik2[0],titik2[1],titik3[0],titik3[1])
	

func layangLayang(titikPusat:Array, diagonal1, diagonal2):
	pass
	var titik1 = [titikPusat[0]-diagonal2/2, titikPusat[1]]
	var titik2 = rotation(titik1, titikPusat, 90)
	var selisihDiagonal = diagonal1-diagonal2
	
	if selisihDiagonal < 0:
		selisihDiagonal = diagonal2-diagonal1
	
	#lineDDA(titik1[0], titik1[1], titik2[0], titik2[1])
	titik1 = titik2
	titik2 = rotation(titik1, titikPusat, 90)
	#lineDDA(titik1[0], titik1[1], titik2[0], titik2[1])
	titik1 = titik2
	titik2 = translation(rotation(titik1, titikPusat, 90),[0,selisihDiagonal])
	#lineDDA(titik1[0], titik1[1], titik2[0], titik2[1])
	titik1 = rotation(titik1,titikPusat,180)
	#lineDDA(titik1[0], titik1[1], titik2[0], titik2[1])

func segiLima(pusat:Array, panjangDiagonal, rotate, rotate2, color):
	var titikPusat = pusat
	put_pixel(pusat[0],pusat[1],Color(1,1,1,1))
	var titik1 =  [titikPusat[0]-panjangDiagonal/2,titikPusat[1]]
	var panjangDiagonalKecil = panjangVektor(titik1,titikPusat)*2.45
	titik1 = rotation(titik1,titikPusat,rotate)
	segiLimaKecil(titik1,panjangDiagonalKecil,90,color)
	var titik2 = rotation(titik1,titikPusat,72)
	#lineDDA(titik1[0],titik1[1],titik2[0],titik2[1])
	
	for i in 4:
		pass
		titik1 = titik2
		segiLimaKecil(titik1,panjangDiagonalKecil,rotate2, color)
		titik2 = rotation(titik1,titikPusat,72)
		#lineDDA(titik1[0],titik1[1],titik2[0],titik2[1])

func segiLimaKecil(pusat:Array, panjangDiagonal, rotate, color):
	pass
	var titikPusat = pusat
	var titik1 =  [titikPusat[0]-panjangDiagonal/2,titikPusat[1]]
	titik1 = rotation(titik1,titikPusat,rotate)
	var titik2 = rotation(titik1,titikPusat,72)
	for i in 5:
		pass
		lineDDA(titik1[0],titik1[1],titik2[0],titik2[1],color)
		titik1 = titik2
		titik2 = rotation(titik1,titikPusat,72)

func segiEnam(pusat:Array, panjangDiagonal):
	var titikPusat = pusat
	var titik1 =  [titikPusat[0]-panjangDiagonal/2,titikPusat[1]]
	var titik2 = rotation(titik1,titikPusat,60)
	for i in 6:
		pass
		#lineDDA(titik1[0],titik1[1],titik2[0],titik2[1])
		titik1 = titik2
		titik2 = rotation(titik1,titikPusat,60)

func trapesium(pusat:Array, panjang):
	pass
	var titikPusat = pusat
	var titik1 = [titikPusat[0]-panjang/2, titikPusat[1]-panjang/2]
	var titik2 = rotation(titik1,titikPusat,90)
	#lineDDA(titik1[0],titik1[1],titik2[0],titik2[1])
	var titik3 = translation(rotation(titik1,titikPusat,-90), [-panjang/2,0])
	#lineDDA(titik1[0],titik1[1],titik3[0],titik3[1])
	titik1 = titik2
	titik2 = translation(rotation(titik1,titikPusat,90), [panjang/2,0])
	#lineDDA(titik1[0],titik1[1],titik2[0],titik2[1])
	#lineDDA(titik3[0],titik3[1],titik2[0],titik2[1])

func circleMidPoint(xCenter, yCenter, radius, color):
	var x = 0
	var y = radius
	var p = 1 - radius
	
	# Plot first set of points #
	circlePlotPoints(xCenter, yCenter, x, y, color)
	
	while (x < y):
		x += 1
		if (p < 0):
			p += 2*x + 1
		else:
			y -= 1
			p += 2*(x-y) + 1
		circlePlotPoints(xCenter, yCenter, x, y, color)
		
func circlePlotPoints(xCenter, yCenter, x, y, color):
	put_pixel(xCenter + x, yCenter + y, color) #1
	put_pixel(xCenter - x, yCenter + y, color) #2
	put_pixel(xCenter + x, yCenter - y, color) #3
	put_pixel(xCenter - x, yCenter - y, color) #4
	put_pixel(xCenter + y, yCenter + x, color) #5
	put_pixel(xCenter - y, yCenter + x, color) #6
	put_pixel(xCenter + y, yCenter - x, color) #7
	put_pixel(xCenter - y, yCenter - x, color) #8
	
func ellipseMidPoint(xCenter, yCenter, Rx, Ry, color):
	var Rx2 = Rx*Rx
	var Ry2 = Ry*Ry
	var twoRx2 = 2*Rx2
	var twoRy2 = 2*Ry2
	var p
	var x = 0
	var y = Ry
	var px = 0
	var py = twoRx2*y
	
	# Plot the first set of points #
	ellipsePlotPoints(xCenter, yCenter, x, y, color)
	
	# Region 1 #
	p = round(Ry2 - (Rx2*Ry) + (0.25 * Rx2))
	while (px < py):
		x += 1
		px += twoRy2
		if (p < 0):
			p += Ry2 + px
		else:
			y -= 1
			py -= twoRx2
			p += Ry2 + px - py
		ellipsePlotPoints(xCenter, yCenter, x, y, color)
		
	# Region 2 #
	p = round(Ry2*(x+0.5)*(x+0.5) + Rx2*(y-1)*(y-1) - Rx2*Ry2)
	while (y > 0):
		y -= 1
		py -= twoRx2
		if (p > 0):
			p += Rx2 - py
		else :
			x += 1
			px += twoRy2
			p += Rx2 - py + px
		ellipsePlotPoints(xCenter, yCenter, x, y, color)
		
func ellipsePlotPoints(xCenter, yCenter, x, y, color):
	put_pixel(xCenter + x, yCenter + y, color)
	put_pixel(xCenter - x, yCenter + y, color)
	put_pixel(xCenter + x, yCenter - y, color)
	put_pixel(xCenter - x, yCenter - y, color)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func sabit(pusat:Array, radius):
	pass
	var i = 1
	var warna = Color(1,1,1,1)
	var titik1=[pusat[0]+radius/2,pusat[1]]
	titik1 = rotation(titik1,pusat,-45)
	while i < 270 :
		put_pixel(titik1[0],titik1[1],warna)
		titik1 = rotation(titik1,pusat,1)
		i += 1
	
	var pusat2 = [pusat[0],pusat[1]-radius/4]
	
	while i < 495:
		put_pixel(titik1[0],titik1[1],warna)
		titik1 = rotation(titik1,pusat2,-1)
		i += 1

func lingkaran(titikPusat:Array,radius):
	pass
	var warna = Color(1,1,1,1)
	var titik1=[titikPusat[0]+radius/2,titikPusat[1]]
	for i in 360:
		pass
		put_pixel(titik1[0],titik1[1],warna)
		titik1 = rotation(titik1,titikPusat,i)
		
func awan(xCenter, yCenter, radius):
	var i = 1;
	circleMidPoint(xCenter, yCenter, radius, Color.white)
	circleMidPoint(xCenter + radius, yCenter + 0.3*radius, radius, Color.white)
	circleMidPoint(xCenter + 2*radius, yCenter, radius, Color.white)
	circleMidPoint(xCenter + radius, yCenter - 0.4*radius, radius, Color.white)
	while (i <= radius):
		circleMidPoint(xCenter, yCenter, radius - i, Color.white)
		circleMidPoint(xCenter + radius, yCenter + 0.3*radius, radius - i, Color.white)
		circleMidPoint(xCenter + 2*radius, yCenter, radius - i, Color.white)
		circleMidPoint(xCenter + radius, yCenter - 0.4*radius, radius - i, Color.white)
		i += 1

func matahari(xCenter,yCenter, radius):
	var i = 1
	circleMidPoint(xCenter,yCenter, radius, Color.orange)
	while (i <= radius):
		circleMidPoint(xCenter,yCenter, radius - i, Color.orange)
		i += 1
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
