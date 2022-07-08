extends Resource
class_name ZombieSpawnerConfiguration


export(PackedScene) var _zombie_scene = preload("res://zombie/scene/Zombie.tscn")


export (float) var _base_cd: float = 5
export (int) var _base_spawn_number: int = 1
export (float) var _base_time_before_level_up: float = 5


export (float) var _cd_by_level: float = 0.25
export (float) var _minimun_cd: float = 1
export (float) var _spawn_number_by_level: float = 0.25
export (float) var _time_before_level_up_by_level: float = 1.25


var _current_level: int = 0


func get_current_level() -> int:
	return _current_level


func get_zombie_instance() -> KinematicBody2D:
	return _zombie_scene.instance()



func level_up() -> void:
	print("Spawn level up: " ,_current_level + 1)
	_current_level = _current_level + 1


func get_cd() -> float:
	print(max(_minimun_cd, _base_cd - (_cd_by_level * _current_level)))
	return max(_minimun_cd, _base_cd - (_cd_by_level * _current_level))


func get_time_before_level_up() -> float:
	return _base_time_before_level_up + (_time_before_level_up_by_level * _current_level)


func get_spawn_number() -> int:
	if get_cd() > _minimun_cd:
		return _base_spawn_number

	return int(floor(_base_spawn_number + (_spawn_number_by_level * _current_level)))
