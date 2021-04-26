extends Node

export (PackedScene) var Asteroides
var marcador

func _ready():
	randomize()
	
func nova_partida():
	marcador = 0
	$Personatge.inici($Posicio_inicial.position)
	$Timer_inici.start()
	$Menu_inici.mostrar_missatge("Preparat!")
	$Menu_inici.update_score(marcador)

func game_over():
	$Score_timer.stop()
	$Timer_asteroide.stop()
	$Menu_inici.game_over()
	

func _on_Timer_inici_timeout():
	$Timer_asteroide.start()
	$Score_timer.start()


func _on_Score_timer_timeout():
	marcador += 1
	$Menu_inici.update_score(marcador)


func _on_Timer_asteroide_timeout():
	#seleccionar un lloc de sortida dels asteroides
	$Path2D/PathFollow2D.set_offset(randi())
	
	var A = Asteroides.instance()
	add_child(A)
	
	var direccio = $Path2D/PathFollow2D.rotation
	
	A.position = $Path2D/PathFollow2D.position
	
	direccio += rand_range(-PI /4, PI /4)
	A.rotation = direccio
	A.set_linear_velocity(Vector2(rand_range(A.velocitat_min, A.velocitat_max), 0).rotated(direccio))
