class_name Bullet extends Area2D

var faction: Game.Faction

var direction: Vector2 = Vector2.RIGHT

@export var speed: float = 100.0
@export var acceleration: float = 0.0
@export var turn_rate: float = 0.0 * TAU # TAU is revolutions per second. 

var damage: float = 100.0
var distance_travelled: float = 0.0
var time_elapsed: float = 0.0


func _physics_process(delta: float) -> void:
	time_elapsed += delta
	
	position += direction.normalized() * speed * delta
	
	var dir_angle = Vector2.RIGHT.angle_to(direction)
	dir_angle += turn_rate * delta
	direction = Vector2.RIGHT.rotated(dir_angle)
	
	speed += acceleration * delta
	

func deflected(deflector: Creature, new_direction: Vector2) -> void:
	set_faction(deflector.faction)
	direction = new_direction
	

func set_faction(new_faction: Game.Faction) -> void:
	faction = new_faction
	

func _on_body_entered(body: Node2D) -> void:
	if body is Creature and body.faction != faction:
		body.take_damage(damage)
		queue_free()
	
