extends Node

signal player_parried()
signal player_died(player: PlayerCharacter)
signal enemy_died(enemy_mob: EnemyMob)

enum Faction { 
		PLAYER, 
		ENEMY, 
}

enum Dungeon { 
		PRONTERA_FIELD,
}

enum FloorType {
		HUB,
		COMBAT_CLEAR,
		COMBAT_SURVIVE,
		COMBAT_ESCAPE,
		EVENT,
		SHOP,
		REST,
		MINIBOSS,
		BOSS,
}

enum Monster {
		RATTATA,
		PIDGEY,
}

const SCENE_TITLE = preload("res://scenes/scene_title.tscn")
const SCENE_HUB = preload("res://scenes/scene_hub.tscn")
const SCENE_ARENA = preload("res://scenes/scene_arena.tscn")
