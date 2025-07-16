extends Node

var current_dungeon: Dungeon
var current_floor: int

var floor_manager: FloorManager

func create_dungeon(dungeon: Game.Dungeon) -> void:
	current_dungeon = Dungeon.new(dungeon)
	# TODO: Have DungeonManager do the randomizing of the dungeon.
	

func move_to_floor(value: int) -> void:
	if value <= current_dungeon.size():
		print("Moving to Floor ", value)
		current_floor = value
		match current_dungeon.get_floor_type(current_floor):
			# TODO: Add floor type Floor Managers?
			Game.FloorType.HUB:
				# Move to Hub
				pass
			_:
				floor_manager = CombatFloorManager.new() # Pass dungeon data?
				pass
			
		floor_manager.floor_cleared.connect(on_floor_manager_floor_cleared)
	else:
		print("Trying to move to a floor that is out of bounds.")
	

func move_to_next_floor() -> void:
	move_to_floor(current_floor + 1)
	

func on_floor_manager_floor_cleared() -> void:
	print("Floor cleared. Moving to next floor.")
	move_to_next_floor()
	
