extends Node2D


func _ready() -> void:
	EventBus.connect("class_selected_signal", self, "_class_selected")


func _class_selected(profession: Resource) -> void:
	var player: Node2D = get_parent()

	var _weapon: Weapon = profession.weapon_scene.instance()
	player.add_child(_weapon)

	if player.has_method("set_profession"):
		player.set_profession(profession);
