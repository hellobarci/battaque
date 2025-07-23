extends Area2D

signal combo_hit
signal miss

var holder: Creature


func set_holder(new_holder: Creature) -> void:
	holder = new_holder
	

func _input(event: InputEvent) -> void:
	# Attack function for the weapon. Remember to use get_overlapping_bodies()
	if Input.is_action_just_pressed("attack"):
		attack()
	

func attack() -> void:
	var targets_hit: int = 0
	
	for area in get_overlapping_areas():
		if area is Bullet:
			print("Deflected: ", area)
			Game.player_parried.emit()
			targets_hit += 1
			area.deflected(holder, Vector2.RIGHT)
	
	if targets_hit > 0:
		combo_hit.emit()
	else:
		miss.emit()
	
