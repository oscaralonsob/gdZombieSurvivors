extends Resource
class_name Perk

export (ProfessionEnums.StatType) var _statType: int
export (ProfessionEnums.PerkType) var _perkType: int
export (float) var _value: float


func get_stat_type() -> int:
	return _statType


func get_perk_type() -> int:
	return _perkType


func get_value() -> float:
	return _value
