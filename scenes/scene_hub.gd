extends Node


func _on_button_pressed() -> void:
	DungeonManager.create_dungeon(Game.Dungeon.PRONTERA_FIELD)
	DungeonManager.move_to_floor(1)
	
