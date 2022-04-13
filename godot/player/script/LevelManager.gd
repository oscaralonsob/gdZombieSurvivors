extends Node2D


export (int) var starting_level: int = 0
export (float) var starting_experience: int = 0
export (float) var experience_needed: int = 0


var _current_experience: float = 0
var _current_level: int = 0


func _ready():
	EventBus.connect("exp_picked_up_signal", self, "_add_experience")
	EventBus.emit_signal("exp_updated_signal", _current_experience, experience_needed)


func _add_experience(amount: float) -> void:
	_current_experience += amount
	EventBus.emit_signal("exp_updated_signal", _current_experience, experience_needed)
