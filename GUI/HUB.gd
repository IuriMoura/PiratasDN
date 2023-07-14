extends CanvasLayer

func atualiza_dados(vida, potions, ouro):
	atualiza_vida(vida)
	atualiza_pocoes(potions)
	atualiza_gold(ouro)
	
func atualiza_vida(valor):
	$Control/ProgressBar.value = valor
	$Control/TextureProgress.value = valor
	
func atualiza_pocoes(valor):
	$Control/ItemList.set_item_text(0, " x " + str(valor))
	
func atualiza_gold(valor):
	$Control/ItemList.set_item_text(1, "x " + str(valor))
