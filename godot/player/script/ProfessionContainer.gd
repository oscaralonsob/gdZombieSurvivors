extends Resource
class_name ProfessionContainer


export (PackedScene) var weapon_scene
export (Resource) var health
export (Resource) var speed
export (Resource) var damage
export (Resource) var cooldown_reduction
export (Array, Resource) var perks


var _rng = RandomNumberGenerator.new()


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


func get_random_perk() -> Resource:
    _rng.randomize()
    return perks[_rng.randf_range(0, perks.size() - 1)]