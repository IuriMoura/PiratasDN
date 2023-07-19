extends CanvasLayer

onready var HUD = get_node("/root").find_node("HUB", true, false)
onready var player = get_node("/root").find_node("Jogador", true, false)

func _input(event):
	if Input.is_action_just_pressed("inventario"):
		HUD.visible = false
		preenche_dados()
		get_tree().call_group("mobile", "congelar")
		$Popup.popup()

func preenche_dados():
	$Popup/Ouro.text = "Ouro: " + str(player.ouro)
	if player.arma:
		$Popup/Arma/Sprite.texture = load(player.arma.imagem)
		
	var objetos = $Popup/Items.get_children()
	
	limpar_imagens(objetos)
	
	var count = 0
	
	for i in player.inventario:
		var imagem = objetos[count].get_children()
		imagem[0].texture = load(i.imagem)
		count += 1
		 
func limpar_imagens(item):
	for i in item:
		var imagem = i.get_children()
		imagem[0].texture = null

func _on_Voltar_pressed():
	HUD.visible = true
	get_tree().call_group("mobile", "descongelar")
	$Popup.hide()
