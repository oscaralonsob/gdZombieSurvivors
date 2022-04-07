extends Node2D
class_name CDHelper
#TODO: create a CDHelper (loop, this one) and a timerHelper (non loop, just once)


var _cd: float = 0
var _current_cd: float = 0
var _func_ref: FuncRef
var _is_loop: bool


func init(cd: float, parent: Node2D, func_name: String, is_loop: bool = true) -> void:
	parent.add_child(self)
	
	_func_ref = funcref(parent, func_name)
	_cd = cd
	_is_loop = is_loop


func put_on_cd() -> void:
	_current_cd = _cd


func _is_in_cd() -> bool:
	return _current_cd > 0


func _process(delta: float) -> void:
	if _is_in_cd():
		_current_cd -= delta
	else:
		_func_ref.call_func()
		
		if _is_loop:
			put_on_cd()
