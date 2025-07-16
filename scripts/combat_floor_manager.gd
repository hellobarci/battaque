class_name CombatFloorManager extends FloorManager

var floor_type: Game.FloorType
var initial_troop_spawn: int
var max_troop_spawn: int
var base_spawn_delay: float
var variance_spawn_delay: float
var spawned_troop_count: int
var spawn_pool: Array[Game.Monster]

var troops_alive: int = 0
var troops_killed: int = 0

func add_troops_alive_count(value: int) -> void:
	troops_alive += value
	if value < 0:
		troops_killed += abs(value)
	if troops_killed >= 3:
		floor_cleared.emit()
	
