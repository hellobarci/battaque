class_name Creature extends CharacterBody2D

var facing_direction: String = "south"
var faction: Game.Faction
var health: float = 100.0


func set_facing_direction(direction: Vector2) -> void:
	if direction != Vector2.ZERO:
		var direction_array: Array[String] = [
				"west",
				"northwest",
				"north",
				"northeast",
				"east",
				"southeast",
				"south",
				"southwest",
		]
		# I'm proud of this, calculating index from radians.
		var direction_index: int = (ceili(4 * (direction.angle() / PI) + 4.5) - 1) % 8
		facing_direction = direction_array[direction_index]
	


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
	
