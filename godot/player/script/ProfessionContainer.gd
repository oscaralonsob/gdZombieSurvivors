extends Resource
class_name ProfessionContainer


export (PackedScene) var weapon_scene
export (Resource) var health

func get_health() -> Stat:
    return health as Stat
