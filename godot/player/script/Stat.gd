extends Resource
class_name Stat


export (ProfessionEnums.StatType) var _stat_type: int
export (int) var _base_value: float
export (Array, Resource) var _current_perks: Array


func get_stat_type() -> int:
	return _stat_type


func get_base_value() -> float:
	return _base_value


func get_value() -> float:
	var total_flat_value: float = 0
	var total_percentage_value: float = 0
	var _value: float = 0
	
	for _perk in _current_perks:
		var perk: Perk = _perk
		
		if perk.get_perk_type() == ProfessionEnums.PerkType.FLAT:
			total_flat_value = perk.get_value()
		else:
			total_percentage_value = perk.get_value()
	
	_value = _base_value + total_flat_value
	_value = _value + _value * total_percentage_value / 100
	
	return _value


func get_current_perks() -> Array:
	return _current_perks


func add_perk(perk: Perk) -> void:
	_current_perks.append(perk)
