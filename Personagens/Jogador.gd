extends "res://Personagens/Personagem.gd"

export var HP_max : int
var arma = false
var potion = 0
var inventario = []
var ouro = 0

func _ready():
	velocidade = vel_normal

func _process(delta):
	atualiza_hud()
	
func atualiza_hud():
	get_tree().call_group("HUD", "atualiza_dados", HP, potion, ouro)

func _input(event):
	if Input.is_action_just_pressed("ataque") and arma:
		$AnimationPlayer.play("ataque" + frente)
		set_physics_process(false)
	elif Input.is_action_just_pressed("item") and potion > 0:
		HP += 3
		#não sei porque mas esta zerando o HP
		
		if HP > HP_max:
			HP = HP_max
			
		potion -= 1
		
		if potion == 0:
			for i in inventario:
				if i.nome == "PocaoHP":
					inventario.erase(i)
					#não apaga o item

func receber_item(item):
	if item.usavel:
		if item.nome == "pocaoHP":
			potion += 1
		
		var achou = false
		for i in inventario:
			if item.nome == i.nome:
				achou = true
				
		if not achou:
			inventario.append(item)
	else:
		dano = item.atributo
		arma = item
	
func definir_movimento():
	direcao.x = Input.get_axis("esquerda", "direita")
	direcao.y = Input.get_axis("cima", "baixo")
	
	definir_direcao()
	
func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		$AnimatedSprite.stop()
	else:
		if arma:
			$AnimatedSprite.play("espada" + frente)
		else:
			$AnimatedSprite.play("andar" + frente)

func morrer():
	get_tree().change_scene("res://GUI/GameOver.tscn")

func _on_AtaqueArea_body_entered(body):
	if body.collision_layer == 8:
		body.recebeu_ataque(dano, frente)


func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
