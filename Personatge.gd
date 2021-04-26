extends Area2D

export var velocitat := Vector2(300, 300)
var moviment = Vector2()
var limit
signal contacte

func _ready():
	hide()
	limit = get_viewport_rect().size 

func _process(delta):
	moviment = Vector2.ZERO
	
	moviment.x = Input.get_action_strength("right key") - Input.get_action_strength("left key")
	moviment.y = Input.get_action_strength("lower key") - Input.get_action_strength("upper key")
	moviment = moviment.normalized() * velocitat
	
	position += moviment * delta #actualitzar els moviments
	position.x = clamp(position.x, 0, limit.x) #establir límits
	position.y = clamp(position.y, 0, limit.y)
	
	if moviment.x != 0:
		$Sprite_personatge.animation = "costat"
		$Sprite_personatge.flip_h = moviment.x < 0
		$Sprite_personatge.flip_v = false 
	elif moviment.y != 0:
		$Sprite_personatge.animation = "darrera"
		$Sprite_personatge.flip_v = moviment.y > 0
	else:
		$Sprite_personatge.animation = "davant"
		

func _on_Personatge_body_entered(body):
	hide()
	emit_signal("contacte")
	$CollisionShape2D.disabled = true
	
func inici(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
