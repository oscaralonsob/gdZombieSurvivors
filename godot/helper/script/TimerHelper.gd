extends Node2D
class_name TimerHelper


var _cd: float = 0
var _current_cd: float = 0
var _func_ref: FuncRef


func init(cd: float, parent: Node2D, func_name: String) -> void:
	parent.add_child(self)
	
	_func_ref = funcref(parent, func_name)
	_cd = cd


func reset() -> void:
	_current_cd = _cd


func _is_in_cd() -> bool:
	return _current_cd > 0


func _process(delta: float) -> void:
	if _is_in_cd():
		_current_cd -= delta
	else:
		_func_ref.call_func()
