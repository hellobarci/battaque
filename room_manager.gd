class_name RoomManager extends Node

const ENEMIES_NEEDED_TO_KILL: int = 1

signal goal_reached

var enemies_killed: int = 0


func reset() -> void:
	enemies_killed = 0
	

func add_kill(value: int) -> void:
	enemies_killed += value
	if enemies_killed >= ENEMIES_NEEDED_TO_KILL:
		goal_reached.emit()
	
