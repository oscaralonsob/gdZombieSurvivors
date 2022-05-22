extends Resource
class_name ProfessionContainer


export (PackedScene) var weapon_scene
export (Resource) var health
export (Resource) var speed
export (Resource) var damage
export (Resource) var cooldown_reduction
export (Array, Resource) var perks


var _rng = RandomNumberGenerator.new()


func get_weapon_scene():
	return weapon_scene


func get_health() -> Stat:
	return health as Stat


func get_speed() -> Stat:
	return speed as Stat


func get_damage() -> Stat:
	return damage as Stat


func get_cooldown_reduction() -> Stat:
	return cooldown_reduction as Stat


func get_perks() -> Array:
	return perks


func get_perk(i: int) -> Perk:
	return perks[i] as Perk


func get_random_perk() -> Perk:
	_rng.randomize()
	return perks[_rng.randf_range(0, perks.size() - 1)] as Perk


func add_random_perk() -> void:
	add_perk(get_random_perk())


func add_perk(perk: Perk) -> void:
	var stat = perk.get_stat_type()
	match stat:
		ProfessionEnums.StatType.HEALTH:
			health.add_perk(perk)
		ProfessionEnums.StatType.SPEED:
			speed.add_perk(perk)
		ProfessionEnums.StatType.DAMAGE:
			damage.add_perk(perk)
		ProfessionEnums.StatType.COOLDOWN_REDUCTION:
			cooldown_reduction.add_perk(perk)
