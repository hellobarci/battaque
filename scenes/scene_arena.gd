extends Node

# var combat_floor_manager = CombatFloorManager.new()
const ENEMY_SPAWNER = preload("res://enemy_spawner.tscn")


func _ready() -> void:
	# Spawn Enemies
	var enemy_spawner = ENEMY_SPAWNER.instantiate()
	enemy_spawner.set_floor_troop_data(DungeonManager.get_current_floor_troop_data())
	enemy_spawner.enemy_mob_spawned.connect(_on_enemy_spawner_enemy_mob_spawned)
	enemy_spawner.global_position.x = 600
	add_child(enemy_spawner)
	
	Game.bullet_spawned.connect(_on_bullet_spawned)
	Game.enemy_died.connect(_on_enemy_died)
	
	DungeonManager.floor_manager.floor_cleared.connect(_on_floor_cleared)
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()
	if Input.is_action_just_pressed("reload"):
		reload()
	

func pause() -> void:
	get_tree().paused = true
	$PauseCanvas.show()
	

func reload() -> void:
	get_tree().reload_current_scene()
	

func _on_enemy_spawner_enemy_mob_spawned(enemy_mob: EnemyMob, spawn_position: Vector2) -> void:
	if not DungeonManager.floor_manager.is_floor_cleared:
		enemy_mob.global_position = spawn_position
		add_child(enemy_mob)
		# BUG: One enemy killed and each spawn evaluates that kill as valid, stacking reward canvases.
		# Pause the game while reward canvas is up?
		DungeonManager.floor_manager.add_enemy_count(1)
	

func _on_bullet_spawned(bullet: Bullet, spawn_position: Vector2) -> void:
	bullet.global_position = spawn_position
	add_child(bullet)
	

func _on_enemy_died(enemy_mob: EnemyMob) -> void:
	DungeonManager.floor_manager.add_enemy_count(-1)
	

func _on_floor_cleared() -> void:
	show_stairs()
	show_treasure_chest()
	

func show_stairs() -> void:
	$Stairs.monitoring = true
	$Stairs.visible = true
	

func show_treasure_chest() -> void:
	$TreasureChest.monitoring = true
	$TreasureChest.visible = true
	

func _on_stairs_body_entered(body: Node2D) -> void:
	DungeonManager.floor_manager.floor_exited.emit()
	
