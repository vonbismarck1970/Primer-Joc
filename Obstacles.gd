extends RigidBody2D

export (int) var velocitat_min = 100
export (int) var velocitat_max = 250

func _ready():
	$Sprite_asteroide.animation = [randi() ]

	if $AnimatedSprite.animation == "gran":
		CollisionShape2D.radius = 36.5
	else:
		CollisionShape2D.radius == 12
#canviar colision_shape depenent del tipus d asteroide
func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #eliminar asteroide
