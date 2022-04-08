extends Position2D


export(PackedScene) var bullet_scene


# TODO: probably move this to the gun itself once I decide who to manage different kinds of weapons
onready var _weapon_cd: CDHelper = preload("res://helper/scene/CDHelper.tscn").instance()


func _ready():
	_weapon_cd.init(1, self, "_shoot")


func _shoot() -> void:
	var bullet: Node2D = bullet_scene.instance()
	get_tree().get_root().get_node(".").add_child(bullet)
	bullet.global_rotation = global_rotation
	bullet.global_position = global_position
