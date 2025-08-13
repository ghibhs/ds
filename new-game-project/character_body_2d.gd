extends CharacterBody2D

@export var speed: float = 150.0
@export var jump_velocity: float = -300.0
@export var acceleration: float = 1500.0
@export var friction: float = 1200.0

var coins: int = 0
# Referência do nó de gravidade
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Adiciona gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Pulo
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
	
	# Movimento horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		# Acelera na direção do input
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		# Aplica friction quando não há input
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	
	move_and_slide()
