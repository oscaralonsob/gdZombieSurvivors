extends CanvasLayer


func _ready() -> void:
	EventBus.connect("scene_fully_loaded_signal", self, "_enable_select_class")
	EventBus.connect("class_selected_signal", self, "_selected_class")


func _enable_select_class() -> void:
	EventBus.disconnect("scene_fully_loaded_signal", self, "_enable_select_class")
	$ClassMenu2.visible = true
	get_tree().paused = true


func _selected_class(class_container: ClassContainer) -> void:
	$ClassMenu2.visible = false
	get_tree().paused = false
