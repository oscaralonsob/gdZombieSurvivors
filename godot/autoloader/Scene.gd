extends Node2D


func _ready():
	EventBus.emit_signal("scene_fully_loaded_signal")
