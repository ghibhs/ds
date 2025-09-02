extends Control

@onready var player = get_node("../Player")
@onready var coin_label = $CoinLabel

func _ready():
	# Acessa as moedas do player
	var current_coins = player.coins
	coin_label.text = "Moedas: " + str(current_coins)

func _process(delta):
	# Atualiza constantemente (não muito eficiente, mas funciona)
	coin_label.text = "Moedas: " + str(player.coins)
