extends Node2D


export(PackedScene) var zombie_scene


onready var _spawner_cd: CDHelper = preload("res://helper/scene/CDHelper.tscn").instance()


func _ready() -> void:
	_spawner_cd.init(2, self, "_spawn")


func _spawn()-> void:
	var zombie: KinematicBody2D = zombie_scene.instance()
	get_parent().add_child(zombie)


# TODO: get randomly points outside the screen and spawn there
