extends Node2D


export (PackedScene) var class_scene
onready var _class: ClassContainer = class_scene.instance()
onready var _weapon: Weapon = _class.weapon_scene.instance()


func _ready() -> void:
	EventBus.connect("scene_fully_loaded_signal", self, "_class_selected")


func _class_selected() -> void:
	get_parent().add_child(_weapon)
