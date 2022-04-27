extends Resource
class_name ProfessionContainer


export (PackedScene) var weapon_scene
export (Resource) var health
export (Resource) var speed

func get_health() -> Stat:
    return health as Stat


func get_speed() -> Stat:
    return speed as Stat
