extends Node

var current_dungeon: Dungeon
var current_floor: int

var floor_manager: FloorManager

func create_dungeon(dungeon: Game.Dungeon) -> void:
	current_dungeon = Dungeon.new(dungeon)
	add_child(current_dungeon)
	# TODO: Have DungeonManager do the randomizing of the dungeon.
	

func move_to_floor(value: int) -> void:
	if value <= current_dungeon.size():
		print("Moving to Floor ", value)
		current_floor = value
		match current_dungeon.get_floor_type(current_floor):
			Game.FloorType.HUB:
				# Move to Hub
				pass
			# TODO: Add floor type Floor Managers?
			# Game.FloorType.COMBAT_CLEAR:
			_:
				floor_manager = CombatFloorManager.new() # Pass dungeon data?
			
		floor_manager.floor_exited.connect(_on_floor_manager_floor_exited)
		add_child(floor_manager)
	else:
		print("Trying to move to a floor that is out of bounds.")
	

func move_to_next_floor() -> void:
	move_to_floor(current_floor + 1)
	

func _on_floor_manager_floor_exited() -> void:
	print("Floor exited. Moving to next floor.")
	move_to_next_floor()
	

func get_current_floor_troop_data() -> FloorTroopData:
	return current_dungeon.dungeon_data.get_floor_troop_data(current_floor)
	
