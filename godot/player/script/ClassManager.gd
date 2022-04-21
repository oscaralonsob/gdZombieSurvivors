extends Node2D


var _class: ClassContainer
var _weapon: Weapon


func _ready() -> void:
	EventBus.connect("class_selected_signal", self, "_class_selected")


func _class_selected(class_scene: PackedScene) -> void:
	_class = class_scene.instance()
	_weapon = _class.weapon_scene.instance()
	get_parent().add_child(_weapon)
