class_name EnemyMob extends Creature

const BULLET = preload("res://bullet.tscn")


func _init() -> void:
	set_faction(Game.Faction.ENEMY)
	

func shoot() -> void:
	$Sprite.play("attack_west")
	var new_bullet: Bullet = BULLET.instantiate()
	new_bullet.set_faction(self.faction)
	Game.bullet_spawned.emit(new_bullet, self.global_position)
	

func _on_attack_timer_timeout() -> void:
	shoot()
	

func die() -> void:
	print("Enemy Death: ", self)
	Game.enemy_died.emit(self)
	queue_free()
	
