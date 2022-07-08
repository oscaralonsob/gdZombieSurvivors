extends Label


var _counter: float = 0.0


func _process(delta: float) -> void:
	_counter += delta
	self.text = str("TIME SURVIVED: " ,stepify(_counter, 1))
