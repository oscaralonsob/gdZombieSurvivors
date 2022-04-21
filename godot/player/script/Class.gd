extends Node2D
class_name ClassContainer


export (PackedScene) var weapon_scene


onready var _weapon: Weapon = weapon_scene.instance()
