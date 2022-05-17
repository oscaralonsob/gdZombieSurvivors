extends Resource
class_name ProfessionContainer


export (PackedScene) var weapon_scene
export (Resource) var health
export (Resource) var speed
export (Resource) var damage
export (Resource) var cooldown_reduction


func get_health() -> Stat:
    return health as Stat


func get_speed() -> Stat:
    return speed as Stat


func get_damage() -> Stat:
    return damage as Stat


func get_cooldown_reduction() -> Stat:
    return cooldown_reduction as Stat