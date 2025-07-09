extends Node2D

const ENEMY_MOB = preload("res://enemy_mob.tscn")

signal enemy_mob_spawned(enemy_mob: EnemyMob, spawn_position: Vector2)

@export var spawn_timer: float = 1.0


func _ready() -> void:
	set_spawn_timer(spawn_timer)
	

func set_spawn_timer(value: float) -> void:
	$SpawnTimer.wait_time = value
	

func _on_spawn_timer_timeout() -> void:
	var new_enemy_mob: EnemyMob = ENEMY_MOB.instantiate()
	# TODO: Spawn it in a proper position
	enemy_mob_spawned.emit(new_enemy_mob, get_random_position()) 
	

# TODO: Placeholder position
func get_random_position() -> Vector2:
	return Vector2(self.global_position.x, randi_range(100, 600))
	
