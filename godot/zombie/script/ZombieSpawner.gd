extends Node2D


export(PackedScene) var zombie_scene

var _spawner_cd: CDHelper = CDHelper.new(2)

func _process(delta)-> void:
	_spawner_cd.update(delta)
	
	if !_spawner_cd.is_in_cd():
		var zombie: KinematicBody2D = zombie_scene.instance()
		get_parent().add_child(zombie)
		_spawner_cd.put_on_cd()
