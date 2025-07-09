class_name PlayerCharacter extends Creature

enum PlayerState { IDLE, MOVING, ATTACKING, }

const WEAPON = preload("res://weapon.tscn")
const SPEED: float = 100.0

var current_state: PlayerState
var previous_state: PlayerState
var combo_count: int = 0


func _init() -> void:
	set_faction(Game.Faction.PLAYER)
	

func _ready() -> void:
	# Initial State
	change_state(PlayerState.IDLE)
	
	# Add Weapon
	var new_weapon = WEAPON.instantiate()
	new_weapon.set_holder(self)
	new_weapon.combo_hit.connect(on_combo_hit)
	new_weapon.miss.connect(on_miss)
	$WeaponPivot/WeaponAnchor.add_child(new_weapon)
	
	

# Finite State Machine
func change_state(new_state: PlayerState) -> void:
	previous_state = current_state
	exit(current_state)
	enter(new_state)
	current_state = new_state
	

func enter(player_state: PlayerState) -> void:
	$Sprite/Label.text = PlayerState.keys()[player_state]
	match player_state:
		PlayerState.IDLE:
			pass
		PlayerState.MOVING:
			pass
		PlayerState.ATTACKING:
			pass
	

func exit(player_state: PlayerState) -> void:
	match player_state:
		PlayerState.IDLE:
			pass
		PlayerState.MOVING:
			pass
		PlayerState.ATTACKING:
			pass
	

func _input(event: InputEvent) -> void:
	# Direction Parser
	var input_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	set_velocity(input_dir * SPEED)
	
	# State change to Attack
	if Input.is_action_just_pressed("attack"):
		change_state(PlayerState.ATTACKING)
	

func _physics_process(delta: float) -> void:
	# State Manager
	if current_state != PlayerState.MOVING and velocity > Vector2.ZERO:
		change_state(PlayerState.MOVING)
	elif current_state != PlayerState.IDLE and velocity == Vector2.ZERO:
		change_state(PlayerState.IDLE)
	
	# State Process
	match current_state:
		PlayerState.IDLE:
			move_and_slide()
		PlayerState.MOVING:
			move_and_slide()
		PlayerState.ATTACKING:
			move_and_slide()
	

func on_combo_hit() -> void:
	combo_count += 1
	print("Combo: ", combo_count)
	

func on_miss() -> void:
	combo_count = 0
	print("Combo Reset")
	

func die() -> void:
	pass
	
