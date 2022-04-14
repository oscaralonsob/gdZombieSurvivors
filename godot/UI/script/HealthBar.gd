extends ProgressBar


onready var _label: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.connect("player_damaged_signal", self, "_update_bar")


func _update_bar(v: float, max_v: float) -> void:
	value = v
	max_value = max_v
	_label.text = str(v) + "/" + str(max_v)
