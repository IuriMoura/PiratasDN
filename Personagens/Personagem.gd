extends KinematicBody2D

export var velocidade : int
export var HP : int
export var dano : int
export var knockback : int

export var vel_normal : int
export var vel_corrida : int

var direcao = Vector2(0,0)
var frente = ""

func _physics_process(delta):
	definir_movimento()
	definir_animacao()
	move_and_slide(direcao * velocidade)
	
func recebeu_ataque(dano, dir):
	HP -= dano
	
	if HP <= 0:
		$AnimationPlayer.play("morrer")
		set_physics_process(false)
		
	empurrar_tras(dir)
	pos_ataque()

func empurrar_tras(dir):
	$AudioStreamPlayer.stream = load("res://Assets/SFX/Socapex - new_hits_2.wav")
	$AudioStreamPlayer.play()
	
	var nova_posicao = position
	
	if dir == "_cima":
		nova_posicao.y -= knockback
	elif dir == "_baixo":
		nova_posicao.y += knockback
	elif dir == "_direita":
		nova_posicao.x += knockback
	else:
		nova_posicao.x -= knockback
		
	var motion = nova_posicao - position
	
	move_and_slide(motion * knockback)
	
func definir_movimento():
	pass

func definir_animacao():
	pass
	
func pos_ataque():
	pass
	
func definir_direcao():
	if direcao.x > 0 and abs(direcao.x) > abs(direcao.y):
		frente = "_direita"
	elif direcao.x < 0 and abs(direcao.x) > abs(direcao.y):
		frente = "_esquerda"
	elif direcao.y > 0 and abs(direcao.x) < abs(direcao.y):
		frente = "_baixo"
	elif direcao.y < 0 and abs(direcao.x) < abs(direcao.y):
		frente = "_cima"

func congelar():
	set_physics_process(false)
	
func descongelar():
	set_physics_process(true)
