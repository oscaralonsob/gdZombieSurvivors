extends Node2D


export(PackedScene) var zombie_scene


onready var _spawner_cd: CDHelper = preload("res://helper/scene/CDHelper.tscn").instance()
var _rng = RandomNumberGenerator.new()
var _spawn_offset: int = 100

func _ready() -> void:
	_spawner_cd.init(2, self, "_spawn")
	_rng.randomize()


func _spawn() -> void:
	var random_position: Vector2 = _getRandomPosition()
	var zombie: KinematicBody2D = zombie_scene.instance()
	
	zombie.position = random_position;
	get_parent().add_child(zombie)


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
