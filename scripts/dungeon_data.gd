class_name DungeonData

const DUNGEON_DATABASE_PATH: String = "res://database/dungeon_database.json"

const FLOOR_TYPE_TABLES_PATH: String = "res://database/floor_type_tables/"

# Combat Floor Data
const TROOP_CONFIG_TABLES_PATH: String = "res://database/troop_config_tables/"
const TROOP_SPAWN_AMOUNT_TABLES_PATH: String = "res://database/troop_spawn_amount_tables/"
const SPAWN_TABLES_PATH: String = "res://database/spawn_tables/"

var dungeon_database: Array
var floor_type_table: Array
var troop_config_table: Array
var troop_spawn_amount_table: Array
var spawn_table: Array

var identifier: Game.Dungeon
var display_name: String
var floor_count: int
var material_drop: int


func _init(dungeon: Game.Dungeon) -> void:
	load_data(dungeon)
	
	## Dungeon Database
	identifier = Game.Dungeon.get(dungeon_database[dungeon]["identifier"])
	display_name = dungeon_database[dungeon]["displayname"]
	floor_count = dungeon_database[dungeon]["floorcount"]
	material_drop = dungeon_database[dungeon]["materialdrop"]
	

func load_data(dungeon: Game.Dungeon) -> void:
	var file: FileAccess
	
	# dungeon_database.json should have the same order as in Game.Dungeon enum.
	 # ^ Why? Make it so that it isn't.
	file = FileAccess.open(DUNGEON_DATABASE_PATH, FileAccess.READ)
	dungeon_database = JSON.parse_string(file.get_as_text())
	file.close()
	
	file = FileAccess.open("%s%s.json" % [FLOOR_TYPE_TABLES_PATH, Game.Dungeon.keys()[dungeon]], FileAccess.READ)
	floor_type_table = JSON.parse_string(file.get_as_text())
	file.close()
	
	file = FileAccess.open("%s%s.json" % [TROOP_CONFIG_TABLES_PATH, Game.Dungeon.keys()[dungeon]], FileAccess.READ)
	troop_config_table = JSON.parse_string(file.get_as_text())
	file.close()
	
	file = FileAccess.open("%s%s.json" % [TROOP_SPAWN_AMOUNT_TABLES_PATH, Game.Dungeon.keys()[dungeon]], FileAccess.READ)
	troop_spawn_amount_table = JSON.parse_string(file.get_as_text())
	file.close()
	
	file = FileAccess.open("%s%s.json" % [SPAWN_TABLES_PATH, Game.Dungeon.keys()[dungeon]], FileAccess.READ)
	spawn_table = JSON.parse_string(file.get_as_text())
	file.close()
	


func get_random_floor_type(floor: int) -> Game.FloorType:
	var floor_type_pool: Array[Game.FloorType]
	var floor_type_weights: Array[float]
	for entry in floor_type_table:
		if floor >= entry["floorstart"] and floor <= entry["floorend"]:
			floor_type_pool.append(Game.FloorType.get(entry["floortype"]))
			floor_type_weights.append(entry["spawnweight"])
	var RNG = RandomNumberGenerator.new()
	return floor_type_pool[RNG.rand_weighted(floor_type_weights)]
	

func get_floor_troop_data(floor: int) -> FloorTroopData:
	var floor_troop_data: FloorTroopData = FloorTroopData.new()
	
	# Troop Config
	for entry in troop_config_table:
		if floor >= entry["floorstart"] and floor <= entry["floorend"]:
			floor_troop_data.min_initial_troop_spawn = entry["mininitialtroopspawn"]
			floor_troop_data.max_initial_troop_spawn = entry["maxinitialtroopspawn"]
			floor_troop_data.max_troop_spawn = entry["maxtroopspawn"]
			floor_troop_data.min_spawn_delay = entry["minspawndelay"]
			floor_troop_data.max_spawn_delay = entry["maxspawndelay"]
	
	for entry in troop_spawn_amount_table:
		if floor >= entry["floorstart"] and floor <= entry["floorend"]:
			floor_troop_data.troop_spawn_amount_pool.append(int(entry["troopspawnamount"]))
			floor_troop_data.troop_spawn_amount_weights.append(entry["spawnweight"])
			
	
	for entry in spawn_table:
		if floor >= entry["floorstart"] and floor <= entry["floorend"]:
			# TODO: Spawn via monster first, including custom monster levels in the future.
			floor_troop_data.spawn_pool.append(Game.Monster.get(entry["monster"]))
			floor_troop_data.spawn_weights.append(entry["spawnweight"])
	
	return floor_troop_data
	


func get_floor_count() -> int:
	return floor_count
	

func size() -> int:
	return get_floor_count()
	
