class_name EnemyMob extends Creature


func _init() -> void:
	set_faction(Game.Faction.ENEMY)
	

func _ready() -> void:
	$Gun.set_holder(self)
	

func _on_gun_attack_readied() -> void:
	$Sprite.play("attack_west")
	$Gun.look_at(Vector2(100, 100))
	$Gun.shoot()
	

func die() -> void:
	print("Enemy Death: ", self)
	Game.enemy_died.emit(self)
	queue_free()
	
