extends Node

# var combat_floor_manager = CombatFloorManager.new()
const ENEMY_SPAWNER = preload("res://enemy_spawner.tscn")


func _ready() -> void:
	DungeonManager.create_dungeon(Game.Dungeon.PRONTERA_FIELD)
	DungeonManager.move_to_floor(1)
	
	var enemy_spawner = ENEMY_SPAWNER.instantiate()
	enemy_spawner.set_floor_troop_data(DungeonManager.current_dungeon.dungeon_data.get_floor_troop_data(DungeonManager.current_floor))
	enemy_spawner.enemy_mob_spawned.connect(_on_enemy_spawner_enemy_mob_spawned)
	enemy_spawner.global_position.x = 600
	add_child(enemy_spawner)
	
	Game.bullet_spawned.connect(_on_bullet_spawned)
	Game.enemy_died.connect(_on_enemy_died)
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()
	if Input.is_action_just_pressed("reload"):
		reload()
	

func pause() -> void:
	print(DungeonManager.floor_manager)
	print("Pause")
	$PauseCanvas.visible = true
	get_tree().paused = true
	

func reload() -> void:
	get_tree().reload_current_scene()
	

func _on_enemy_spawner_enemy_mob_spawned(enemy_mob: EnemyMob, spawn_position: Vector2) -> void:
	enemy_mob.global_position = spawn_position
	add_child(enemy_mob)
	DungeonManager.floor_manager.add_troops_alive_count(1)
	

func _on_bullet_spawned(bullet: Bullet, spawn_position: Vector2) -> void:
	bullet.global_position = spawn_position
	add_child(bullet)
	

func _on_enemy_died(enemy_mob: EnemyMob) -> void:
	DungeonManager.floor_manager.add_troops_alive_count(-1)
	
