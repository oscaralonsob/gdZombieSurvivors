class_name CDHelper


var _cd: float = 0
var _current_cd: float = 0


func _init(cd: float) -> void:
	_cd = cd


func put_on_cd() -> void:
	_current_cd = _cd


func update(delta: float) -> void:
	if is_in_cd():
		_current_cd -= delta


func is_in_cd() -> bool:
	return _current_cd > 0
