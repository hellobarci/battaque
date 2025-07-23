class_name TriggerSlot extends Node

var trigger: Signal 
var effect_card: EffectCard


func _init(trigger: Signal) -> void:
	set_trigger(trigger)
	

func set_trigger(new_trigger: Signal) -> void:
	trigger = new_trigger
	trigger.connect(triggered)
	

func set_effect_card(new_effect_card: EffectCard) -> void:
	print("New Effect Card: ", new_effect_card.effect_id)
	effect_card = new_effect_card
	

func triggered() -> void:
	print("Triggered")
	effect_card.effect()
	
