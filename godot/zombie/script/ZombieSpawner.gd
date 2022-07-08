extends Node2D


export (Resource) var _spawner_configuration


onready var _spawner_cd: TimerHelper = preload("res://helper/scene/TimerHelper.tscn").instance()
onready var _dificulty_cd: TimerHelper = preload("res://helper/scene/TimerHelper.tscn").instance()


var _rng = RandomNumberGenerator.new()
var _spawn_offset: int = 100

func _ready() -> void:
	_spawner_cd.init(_spawner_configuration.get_cd(), self, "_spawn_and_reset")
	_dificulty_cd.init(_spawner_configuration.get_time_before_level_up(), self, "_level_up_and_reset")
	_rng.randomize()


func _spawn_and_reset() -> void:
	var _number_to_spawn: float = _spawner_configuration.get_spawn_number()
	var _number_spawned: float = 0

	while (_number_spawned < _number_to_spawn):
		var random_position: Vector2 = _getRandomPosition()
		var zombie: KinematicBody2D = _spawner_configuration.get_zombie_instance()
		
		zombie.position = random_position;
		get_parent().add_child(zombie)
		_number_spawned = _number_spawned + 1
	
	_spawner_cd.set_cd_and_reset(_spawner_configuration.get_cd())


func _level_up_and_reset() -> void:
	_spawner_configuration.level_up()
	_dificulty_cd.set_cd_and_reset(_spawner_configuration.get_time_before_level_up())


func _getRandomPosition() -> Vector2:
	var random_position: Vector2 = Vector2(0, 0)
	var viewport_size: Vector2 = get_viewport().size
	var viewport_position: Vector2 = Global.camera.global_position
	var randomized_side: int = _rng.randi_range(0,3)

	random_position.x = _rng.randf_range(0,  viewport_size.x + _spawn_offset)
	random_position.y = _rng.randf_range(0,  viewport_size.y + _spawn_offset)

	match randomized_side:
		0:
			random_position.y = 0
		1:
			random_position.y = viewport_size.y + _spawn_offset
		2:
			random_position.x = 0
		3:
			random_position.x = viewport_size.x + _spawn_offset

	random_position.x = random_position.x + viewport_position.x - viewport_size.x/2
	random_position.y = random_position.y + viewport_position.y - viewport_size.y/2

	return random_position
