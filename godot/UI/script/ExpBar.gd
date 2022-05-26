extends ProgressBar


onready var _label: Label = $Label


func _ready():
	var _connect_result = EventBus.connect("exp_updated_signal", self, "_update_bar")


func _update_bar(expirence: float, max_expirence: float) -> void:
	value = expirence
	max_value = max_expirence
	_label.text = str(expirence) + "/" + str(max_expirence)
