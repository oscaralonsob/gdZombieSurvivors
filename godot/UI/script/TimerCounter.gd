extends Label


var _counter: float = 0


func _ready():
	var _connect_result: int = 0


func _process(delta: float) -> void:
	_counter += delta
	self.text = str("TIME SURVIVED: " ,stepify(_counter, 1))