extends Area2D

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		body.add_coins(10)  # Chama a função do player
		queue_free()
