extends ProgressBar


onready var _label: Label = $Label


func _ready():
	var _connect_result = EventBus.connect("player_health_updated_signal", self, "_update_bar")


func _update_bar(health: float, max_health: float) -> void:
	value = health
	max_value = max_health
	_label.text = str(health) + "/" + str(max_health)
