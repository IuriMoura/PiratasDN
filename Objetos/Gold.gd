extends Area2D

var valor

var ouro = [
	{"valor": 5, "imagem": "res://Assets/Inventario/ouro5.png"},
	{"valor": 10, "imagem": "res://Assets/Inventario/ouro10.png"},
	{"valor": 15, "imagem": "res://Assets/Inventario/ouro15.png"},
	{"valor": 20, "imagem": "res://Assets/Inventario/ouro20.png"},
	{"valor": 25, "imagem": "res://Assets/Inventario/ouro25.png"},
	{"valor": 50, "imagem": "res://Assets/Inventario/ouro50.png"},
	{"valor": 100, "imagem": "res://Assets/Inventario/ouro100.png"},
	{"valor": 150, "imagem": "res://Assets/Inventario/ouro150.png"}
]

func  _ready():
	randomize()
	var escolha = ouro[ randi() % ouro.size()]
	valor = escolha.valor
	$Sprite.texture = load(escolha.imagem)


func _on_Gold_body_entered(body):
	if body.collision_layer == 1:
		body.ouro += valor
		$Sprite.visible = false
		$AudioStreamPlayer.play()

func _on_AudioStreamPlayer_finished():
	queue_free()
