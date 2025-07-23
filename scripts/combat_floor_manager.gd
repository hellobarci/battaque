class_name CombatFloorManager extends FloorManager

const FLOOR_SCENE: PackedScene = Game.SCENE_ARENA

var floor_type: Game.FloorType
var initial_troop_spawn: int
var max_troop_spawn: int
var base_spawn_delay: float
var variance_spawn_delay: float
var spawned_troop_count: int
var spawn_pool: Array[Game.Monster]

var enemy_count: int = 0
var enemies_killed: int = 0


func _ready() -> void:
	get_tree().change_scene_to_packed(FLOOR_SCENE)
	reset_enemies_killed()
	

func reset_enemies_killed() -> void:
	enemies_killed = 0
	

func add_enemy_count(value: int) -> void:
	enemy_count += value
	if value < 0:
		enemies_killed += abs(value)
	if enemies_killed >= 1:
		clear_floor()
		
	

func clear_floor() -> void:
	if not is_floor_cleared:
		is_floor_cleared = true
		floor_cleared.emit()
	
