class_name Creature extends CharacterBody2D

var faction: Game.Faction
var health: float = 100.0


func set_faction(new_faction: Game.Faction) -> void:
	faction = new_faction
	

func take_damage(value: float) -> void:
	health -= value
	if health <= 0.0:
		health = 0.0
		die()
	

# Virtual
func die() -> void:
	pass
	
