extends Camera2D
@export var follow_speed: float = 5.0
@export var offset_distance: Vector2 = Vector2(0, -50)
@export var look_ahead_distance: float = 100.0
@export var smoothing_enabled: bool = true

var target_position: Vector2
var character: CharacterBody2D

func _ready():
	# Encontra o personagem (nó pai)
	character = get_parent()
	
	# Habilita o smoothing se desejado
	if smoothing_enabled:
		enabled = true
		
	# Define a posição inicial
	target_position = character.global_position + offset_distance

func _process(delta):
	if character:
		# Calcula posição alvo com offset e look-ahead
		var look_ahead = Vector2.ZERO
		
		# Look-ahead baseado na direção do movimento
		if character.velocity.x != 0:
			look_ahead.x = sign(character.velocity.x) * look_ahead_distance
		
		target_position = character.global_position + offset_distance + look_ahead
		
		# Move a câmera suavemente
		if smoothing_enabled:
			global_position = global_position.lerp(target_position, follow_speed * delta)
		else:
			global_position = target_position
