extends Label


var _counter: int = -1


func _ready():
	var _connect_result: int = 0
	_connect_result = EventBus.connect("scene_fully_loaded_signal", self, "_update_counter")
	_connect_result = EventBus.connect("enemy_killed_signal", self, "_update_counter")


func _update_counter() -> void:
	_counter += 1
	self.text = str("KILLS: ", _counter)
