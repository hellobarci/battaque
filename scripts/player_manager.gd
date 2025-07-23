extends Node

var trigger_slot: TriggerSlot
# TODO: Functionality for timer nodes?

func get_trigger_slot() -> TriggerSlot:
	print("Current Trigger Slot: ", trigger_slot)
	if not trigger_slot:
		print("No Trigger Slot Found, creating Default")
		var new_trigger_slot = TriggerSlot.new(Game.player_parried)
		trigger_slot = new_trigger_slot
		
		var new_effect_card = EffectCard.new(1)
		
		trigger_slot.set_effect_card(new_effect_card)
		
	return trigger_slot
	
