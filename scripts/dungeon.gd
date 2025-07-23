class_name Dungeon extends Node

var dungeon_data: DungeonData
var floor_types: Array[Game.FloorType] = [ 
		Game.FloorType.HUB, 
]


func _init(dungeon: Game.Dungeon) -> void:
	dungeon_data = DungeonData.new(dungeon)
	for floor in dungeon_data.size():
		# This starts at floor + 1 because indices start at 0.
		floor_types.append(dungeon_data.get_random_floor_type(floor + 1))
		
	

func get_floor_type(floor: int) -> Game.FloorType:
	return floor_types[floor]
	

# get_dungeon_identifier?
# get_dungeon_display_name
# get_dungeon_material_drop

func get_floor_count() -> int:
	return dungeon_data.size()
	

func size() -> int:
	return get_floor_count()
	
