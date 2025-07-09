extends CanvasLayer

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		print("Unpaused")
		call_deferred("unpause")
	

func unpause() -> void:
	visible = false
	get_tree().paused = false
	
