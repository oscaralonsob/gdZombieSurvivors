extends Position2D


export(PackedScene) var bullet_scene


export (float) var base_cd = 0
export (float) var base_damage = 0
export (float) var base_knock_back_force = 0


onready var _weapon_cd: CDHelper = preload("res://helper/scene/CDHelper.tscn").instance()


func _ready():
	_weapon_cd.init(base_cd, self, "_shoot")


func _shoot() -> void:
	var bullet: Projectile = bullet_scene.instance()
	
	if bullet != null:
		bullet.base_damage = base_damage
		bullet.base_knock_back_force = base_knock_back_force
		get_tree().get_root().get_node(".").add_child(bullet)
		bullet.global_rotation = global_rotation
		bullet.global_position = global_position
