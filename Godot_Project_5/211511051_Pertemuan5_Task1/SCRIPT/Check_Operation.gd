extends "res://SCRIPT/primitif.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _draw():
	tambahMatriks([0,5], [1,2])
	kurangMatriks([0,5], [1,2])
	kaliMatriks ([[1,1],[1,2]], [2,2])
	matriksIdentitas()

