extends RigidBody2D

export (int) var velocitat_min = 100
export (int) var velocitat_max = 250

func _ready():
	pass
func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #eliminar asteroide
