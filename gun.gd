class_name Gun extends Node2D

signal attack_readied

const BULLET = preload("res://bullet.tscn")

var holder: Creature

var attack_ready: bool = false

@export var rate_of_fire: float = 2.0
@export var burst_count: int = 1
@export var burst_delay: float = 0.0
@export_range(0.0, 100.0) var accuracy: float = 0.0
var cooldown_delay


func _ready() -> void:
	cooldown_delay = 1.0 / rate_of_fire
	
	var initial_delay = randf_range(0.0, cooldown_delay)
	await get_tree().create_timer(initial_delay).timeout
	ready_attack()
	

func _input(event: InputEvent) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("attack"):
		shoot()
		
	

func set_holder(new_holder: Creature) -> void:
	holder = new_holder
	

func ready_attack() -> void:
	attack_ready = true
	attack_readied.emit()
	

func shoot() -> void:
	if attack_ready:
		attack_ready = false
		for i in burst_count:
			var new_bullet = BULLET.instantiate()
			# Pass Ammo data
			if holder:
				new_bullet.set_faction(holder.faction)
			add_child(new_bullet)
			new_bullet.global_position = global_position
			new_bullet.direction = Vector2.RIGHT.rotated(global_rotation).normalized() # TODO: This is too reaching
			await get_tree().create_timer(burst_delay).timeout
			
		$CooldownTimer.start(cooldown_delay)
		
	

func _on_cooldown_timer_timeout() -> void:
	ready_attack()
	
