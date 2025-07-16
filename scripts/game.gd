extends Node

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

signal player_died(player: PlayerCharacter)
signal enemy_died(enemy_mob: EnemyMob)
signal bullet_spawned(bullet: Bullet, spawn_position: Vector2)
