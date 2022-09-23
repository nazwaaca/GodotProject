extends "res://SCRIPT/line.gd"
func _ready():
	pass # Replace with function body.

func persegi(titik_awal: Vector2, panjang_sisi):
	var res = PoolVector2Array()
	point_point(titik_awal.x, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y) #sisi atas
	point_point(titik_awal.x, titik_awal.y + panjang_sisi, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi) #sisi bawah
	point_point(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + panjang_sisi) #sisi kiri
	point_point(titik_awal.x + panjang_sisi, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi) #sisi kanan
	return res

func persegi_panjang(titik_awal: Vector2, panjang, lebar):
	var res = PoolVector2Array()
	point_dash(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y) #sisi atas
	point_dash(titik_awal.x, titik_awal.y + lebar, titik_awal.x + panjang, titik_awal.y + lebar) #sisi bawah
	point_dash(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + lebar) #sisi kiri
	point_dash(titik_awal.x + panjang, titik_awal.y, titik_awal.x + panjang, titik_awal.y + lebar) #sisi kanan
	return res
	
func segitiga_siku_siku(titik_awal: Vector2, alas, tinggi):
	var res = PoolVector2Array()
	dash_dash(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi) #sisi kiri
	dash_dash(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + alas, titik_awal.y + tinggi) #sisi bawah
	dash_dash(titik_awal.x, titik_awal.y, titik_awal.x + alas, titik_awal.y + tinggi) #sisi kanan
	return res
	
func trapesium_siku_siku(titik_awal: Vector2, atas, tinggi, bawah):
	var res = PoolVector2Array()
	dash_dash(titik_awal.x, titik_awal.y, titik_awal.x + atas, titik_awal.y) #sisi atas
	dash_dash(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + bawah + round(abs(bawah-atas)/2), titik_awal.y + tinggi) #sisi bawah
	dash_dash(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi) #sisi kiri
	dash_dash(titik_awal.x + atas, titik_awal.y, titik_awal.x + bawah, titik_awal.y + tinggi) #sisi kanan
	return res

func jajargenjang(titik_awal: Vector2, panjang, tinggi, geser):
	var res = PoolVector2Array()
	dash_dash(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y) #sisi atas
	dash_dash((titik_awal.x - geser), titik_awal.y + tinggi, (titik_awal.x + panjang - geser), titik_awal.y + tinggi) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, (titik_awal.x - geser), titik_awal.y + tinggi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + panjang, titik_awal.y, ((titik_awal.x + panjang) - geser), titik_awal.y + tinggi)) #sisi kanan
	return res

func ketupat (titik_awal: Vector2, diagonal):
	var res = PoolVector2Array()
	point_dash(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + diagonal)
	point_dash(titik_awal.x - (diagonal/2), titik_awal.y + (diagonal/2), titik_awal.x + (diagonal/2), titik_awal.y + (diagonal/2))
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x  - (diagonal/2), titik_awal.y + (diagonal/2)))
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x  + (diagonal/2), titik_awal.y + (diagonal/2)))
	res.append_array(lineDDA(titik_awal.x - (diagonal/2), titik_awal.y + (diagonal/2), titik_awal.x, titik_awal.y + diagonal))
	res.append_array(lineDDA(titik_awal.x + (diagonal/2), titik_awal.y + (diagonal/2), titik_awal.x, titik_awal.y + diagonal))
	return res

func layanglayang (titik_awal: Vector2, diagonal_a, diagonal_b):
	var res = PoolVector2Array()
	point_dash(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + diagonal_a)
	point_dash(titik_awal.x - (diagonal_b/2), titik_awal.y + (diagonal_a/3), titik_awal.x + (diagonal_b/2), titik_awal.y + (diagonal_a/3))
	res.append_array(bold(titik_awal.x, titik_awal.y, titik_awal.x  - (diagonal_b/2), titik_awal.y + (diagonal_a/3)))
	res.append_array(bold(titik_awal.x, titik_awal.y, titik_awal.x  + (diagonal_b/2), titik_awal.y + (diagonal_a/3)))
	res.append_array(bold(titik_awal.x - (diagonal_b/2), titik_awal.y + (diagonal_a/3), titik_awal.x, titik_awal.y + diagonal_a))
	res.append_array(bold(titik_awal.x + (diagonal_b/2), titik_awal.y + (diagonal_a/3), titik_awal.x, titik_awal.y + diagonal_a))
	return res

func circleMidPoint(xCenter, yCenter, radius, color):
	var x = 0
	var y = radius
	var p = 1 - radius

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
	

	ellipsePlotPoints(xCenter, yCenter, x, y, color)

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


