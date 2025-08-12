extends StaticBody2D

func _ready():
	# Conecta o sinal manualmente se não estiver conectado
	var area = $Area2D
	if not area.body_entered.is_connected(_on_area_2d_body_entered):
		area.body_entered.connect(_on_area_2d_body_entered)

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		queue_free()
