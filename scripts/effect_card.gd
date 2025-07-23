class_name EffectCard extends Node

var effect_id: int


func _init(effect_id: int) -> void:
	set_effect_id(effect_id)
	

func set_effect_id(new_effect_id: int) -> void:
	effect_id = new_effect_id
	

func effect() -> void:
	print("Effect %s occurs" % effect_id)
