class_name Bullet extends Area2D

const SPEED: float = 100.0

var direction: Vector2 = Vector2.LEFT
var faction: Game.Faction
var damage: float = 100.0
var distance_travelled: float = 0.0


func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
	distance_travelled += SPEED * delta
	

func deflected(deflector: Creature, new_direction: Vector2) -> void:
	set_faction(deflector.faction)
	direction = new_direction
	

func set_faction(new_faction: Game.Faction) -> void:
	faction = new_faction
	

func _on_body_entered(body: Node2D) -> void:
	if body is Creature and body.faction != faction:
		body.take_damage(damage)
		queue_free()
