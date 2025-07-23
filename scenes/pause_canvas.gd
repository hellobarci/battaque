extends CanvasLayer

# It's better to have the Pause Canvas handle unpausing, otherwise, your autoload will be able to unpause
# sensitive UIs such as RewardCanvas.
func _input(event: InputEvent) -> void:
	if visible:
		if Input.is_action_just_pressed("pause"):
			visible = false
			call_deferred("unpause")
		
	

func unpause() -> void:
	get_tree().paused = false
	
