extends CanvasLayer

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("attack"):
		get_tree().change_scene_to_packed(Game.SCENE_HUB)
		
	
