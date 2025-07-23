extends Area2D


func _on_body_entered(body: Node2D) -> void:
	# Show Reward Canvas?
	const REWARD_CANVAS = preload("res://scenes/reward_canvas.tscn")
	var reward_canvas = REWARD_CANVAS.instantiate()
	add_child(reward_canvas)
	await reward_canvas.selection_made
	queue_free()
	
