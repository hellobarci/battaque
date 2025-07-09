extends Node

var room_manager = RoomManager.new()

func _ready() -> void:
	room_manager.goal_reached.connect(_on_goal_reached)
	Game.bullet_spawned.connect(_on_bullet_spawned)
	Game.enemy_died.connect(_on_enemy_died)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()
	if Input.is_action_just_pressed("reload"):
		reload()
	

func pause() -> void:
	print("Pause")
	$PauseCanvas.visible = true
	get_tree().paused = true
	

func reload() -> void:
	get_tree().reload_current_scene()
	

func _on_enemy_spawner_enemy_mob_spawned(enemy_mob: EnemyMob, spawn_position: Vector2) -> void:
	enemy_mob.global_position = spawn_position
	add_child(enemy_mob)
	

func _on_bullet_spawned(bullet: Bullet, spawn_position: Vector2) -> void:
	bullet.global_position = spawn_position
	add_child(bullet)
	

func _on_goal_reached() -> void:
	room_manager.reset()
	

func _on_enemy_died(enemy_mob: EnemyMob) -> void:
	room_manager.add_kill(1)
	
