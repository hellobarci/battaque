class_name FloorTroopData

var RNG = RandomNumberGenerator.new()
var min_initial_troop_spawn: int
var max_initial_troop_spawn: int
var max_troop_spawn: int
var min_spawn_delay: float
var max_spawn_delay: float
var troop_spawn_amount_pool: Array[int]
var troop_spawn_amount_weights: Array[float]
var spawn_pool: Array[Game.Monster]
var spawn_weights: Array[float]


func get_random_initial_troop_spawn() -> int:
	return randi_range(min_initial_troop_spawn, max_initial_troop_spawn)
	

func get_random_spawn_delay() -> float:
	return randf_range(min_spawn_delay, max_spawn_delay)
	

func get_random_troop_spawn_amount() -> int:
	return troop_spawn_amount_pool[RNG.rand_weighted(troop_spawn_amount_weights)]
	

func get_random_spawn() -> Game.Monster:
	return spawn_pool[RNG.rand_weighted(spawn_weights)]
	
