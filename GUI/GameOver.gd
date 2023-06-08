extends Control

func _on_Continue_pressed():
	get_tree().change_scene("res://Niveis/Fase01.tscn")


func _on_Exit_pressed():
	get_tree().quit()
