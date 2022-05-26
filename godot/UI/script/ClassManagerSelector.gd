extends Control


export (Array, Resource) var professions: Array


func _on_Class1_pressed():
	EventBus.emit_signal("ui_profession_selected_signal", professions[0])


func _on_Class2_pressed():
	EventBus.emit_signal("ui_profession_selected_signal", professions[1])
