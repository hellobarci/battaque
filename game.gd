extends Node

enum Faction { PLAYER, ENEMY }

signal player_died(player: PlayerCharacter)
signal enemy_died(enemy_mob: EnemyMob)
signal bullet_spawned(bullet: Bullet, spawn_position: Vector2)
