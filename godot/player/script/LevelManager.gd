extends Node2D


const LVL_INCREMENT: int = 2


export (int) var starting_level: int = 0
export (float) var starting_experience: int = 0
export (float) var experience_needed: int = 50


var _current_experience: float = 0
var _current_level: int = 0


func _ready():
	EventBus.connect("scene_fully_loaded_signal", self, "_scene_fully_loaded")
	EventBus.connect("exp_picked_up_signal", self, "_add_experience")
	EventBus.emit_signal("exp_updated_signal", _current_experience, experience_needed)


func _scene_fully_loaded() -> void:
	EventBus.emit_signal("exp_updated_signal", _current_experience, experience_needed)
	

func _add_experience(amount: float) -> void:
	_current_experience += amount
	
	if _current_experience >= experience_needed:
		_current_level += 1
		_current_experience -= experience_needed
		experience_needed *=  LVL_INCREMENT
	
	EventBus.emit_signal("exp_updated_signal", _current_experience, experience_needed)
