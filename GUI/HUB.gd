extends CanvasLayer

func atualiza_health(valor):
	$Control/ProgressBar.value = valor
	$Control/TextureProgress.value = valor
