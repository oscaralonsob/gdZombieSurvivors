extends Node2D


var _profession: ProfessionContainer = null


func _ready() -> void:
	EventBus.connect("class_selected_signal", self, "_class_selected")
	EventBus.connect("level_up_signal", self, "_level_up")


func _class_selected(profession: Resource) -> void:
	_profession = profession

	var player: Node2D = get_parent()
	var _weapon: Weapon = profession.get_weapon_scene().instance()
	player.add_child(_weapon)

	if player.has_method("set_profession"):
		player.set_profession(profession);


func _level_up(level: int) -> void:
	# TODO: At some point, enable the selection menu an allow the player to select the perk, like the class
	print("Level up to: ", level)
	_profession.add_random_perk()


	# TODO: Set profession "heals" the player, we don't want that
	var player: Node2D = get_parent()
	if player.has_method("set_profession"):
		player.set_profession(_profession);
