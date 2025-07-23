extends CanvasLayer

signal effect_card_selected(selected_effect_card: EffectCard)
signal selection_made


func _ready() -> void:
	print("Ready run even when mode is set to paused")
	get_tree().paused = true
	

func _on_button_pressed() -> void:
	var new_effect_card = EffectCard.new(10)
	PlayerManager.trigger_slot.set_effect_card(new_effect_card)
	selection_made.emit()
	

func _on_button_2_pressed() -> void:
	var new_effect_card = EffectCard.new(20)
	PlayerManager.trigger_slot.set_effect_card(new_effect_card)
	selection_made.emit()
	

func _on_button_3_pressed() -> void:
	var new_effect_card = EffectCard.new(30)
	PlayerManager.trigger_slot.set_effect_card(new_effect_card)
	selection_made.emit()
	
	

func _on_selection_made() -> void:
	get_tree().paused = false
	queue_free()
	
