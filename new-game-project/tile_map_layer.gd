extends TileMapLayer

func configure_tile_physics():
	var source = tile_set.get_source(0) as TileSetAtlasSource
	var tile_data = source.get_tile_data(Vector2i(0, 0), 0)
	
	# Configurar fricção
	tile_data.set_constant_linear_velocity(0, Vector2.ZERO)
	tile_data.set_constant_angular_velocity(0, 0.0)
	
	# Configurar material de física
	var physics_material = PhysicsMaterial.new()
	physics_material.friction = 0.8
	physics_material.bounce = 0.2
	tile_data.set_physics_material(0, physics_material)
