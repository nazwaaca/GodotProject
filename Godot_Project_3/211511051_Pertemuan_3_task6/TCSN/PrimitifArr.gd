extends 'res://TCSN/primitif_array.gd'


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func persegi(titik_awal: Vector2, panjang_sisi):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y)) #sisi atas
	res.append_array(lineDDA(titik_awal.x, titik_awal.y + panjang_sisi, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + panjang_sisi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + panjang_sisi, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi)) #sisi kanan
	return res

func persegi_panjang(titik_awal: Vector2, panjang, lebar):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y)) #sisi atas
	res.append_array(lineDDA(titik_awal.x, titik_awal.y + lebar, titik_awal.x + panjang, titik_awal.y + lebar)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + lebar)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + panjang, titik_awal.y, titik_awal.x + panjang, titik_awal.y + lebar)) #sisi kanan
	return res
	
func segitiga_siku_siku(titik_awal: Vector2, alas, tinggi):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + alas, titik_awal.y + tinggi)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + alas, titik_awal.y + tinggi)) #sisi kanan
	return res
	

func trapesium_siku_siku(titik_awal: Vector2, atas, tinggi, bawah):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + atas, titik_awal.y)) #sisi atas
	res.append_array(lineDDA(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + bawah, titik_awal.y + tinggi)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + atas, titik_awal.y, titik_awal.x + bawah, titik_awal.y + tinggi)) #sisi kanan
	return res

func trapesium_sama_kaki(titik_awal: Vector2, atas, tinggi, bawah):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + atas, titik_awal.y)) #sisi atas
	res.append_array(lineDDA((titik_awal.x - ((bawah - atas)/2)), titik_awal.y + tinggi, (titik_awal.x - ((bawah - atas)/2)) + bawah, titik_awal.y + tinggi)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, (titik_awal.x - ((bawah - atas)/2)), titik_awal.y + tinggi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + atas, titik_awal.y, (titik_awal.x - ((bawah - atas)/2)) + bawah, titik_awal.y + tinggi)) #sisi kanan
	return res
	
func jajargenjang(titik_awal: Vector2, panjang, tinggi, geser):
	var res = PoolVector2Array()
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y)) #sisi atas
	res.append_array(lineDDA((titik_awal.x - geser), titik_awal.y + tinggi, (titik_awal.x + panjang - geser), titik_awal.y + tinggi)) #sisi bawah
	res.append_array(lineDDA(titik_awal.x, titik_awal.y, (titik_awal.x - geser), titik_awal.y + tinggi)) #sisi kiri
	res.append_array(lineDDA(titik_awal.x + panjang, titik_awal.y, ((titik_awal.x + panjang) - geser), titik_awal.y + tinggi)) #sisi kanan
	return res
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _draw():
	persegi(Vector2(50,50), 200)
	persegi_panjang(Vector2(350,50),250 , 200)
	segitiga_siku_siku(Vector2(700,50), 200, 200)
	trapesium_siku_siku(Vector2(50,350), 200, 150, 250)
	trapesium_sama_kaki(Vector2(375,350), 200, 150, 300)
	jajargenjang(Vector2(700,350), 200, 150, 50)


func _on_Button3_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://TCSN/Sub_menu.tscn")
