extends Node2D

const ENEMY_MOB = preload("res://enemy_mob.tscn")

signal enemy_mob_spawned(enemy_mob: EnemyMob, spawn_position: Vector2)

var floor_troop_data: FloorTroopData


func set_floor_troop_data(data: FloorTroopData) -> void:
	floor_troop_data = data
	

func _ready() -> void:
	spawn_troops(floor_troop_data.get_random_initial_troop_spawn())
	var new_timer = floor_troop_data.get_random_spawn_delay()
	$SpawnTimer.start(new_timer)
	# Initial Spawns
	

func spawn_troops(troop_spawn_amount: int = -1) -> void:
	if troop_spawn_amount == -1:
		troop_spawn_amount = floor_troop_data.get_random_troop_spawn_amount()
	for i in troop_spawn_amount:
		# TODO: use floor_troop_data.get_random_spawn() to determine Game.Monster.
		var new_enemy_mob: EnemyMob = ENEMY_MOB.instantiate()
		# TODO: Spawn it in a proper position
		enemy_mob_spawned.emit(new_enemy_mob, get_random_position()) 
		
	

func _on_spawn_timer_timeout() -> void:
	# TODO: You need to check against max_troop_spawn. This is a DungeonManager check.
	spawn_troops()
	var new_timer = floor_troop_data.get_random_spawn_delay()
	$SpawnTimer.start(new_timer)
	

# TODO: Placeholder position
func get_random_position() -> Vector2:
	return Vector2(self.global_position.x, randi_range(100, 600))
	
