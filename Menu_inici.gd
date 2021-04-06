extends CanvasLayer

signal iniciar_joc


func mostrar_missatge(textt):
	$Titol.text = textt
	$Titol.show()
	$Timer_missatge.start()
	
func game_over():
	mostrar_missatge("Game over")
	yield($Timer_missatge, "timeout")
	$Button.show()
	$Titol.text = "Space Game"
	$Titol.show()
	
func update_score(punts):
	$Etiqueta_marcador.text = str(punts)
	
func _on_Timer_missatge_timeout():
	$Timer_missatge.hide()

func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar_joc")
