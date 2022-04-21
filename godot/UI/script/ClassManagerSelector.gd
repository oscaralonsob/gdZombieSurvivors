extends Control


export (Array) var classes: Array



func _on_Class1_pressed():
	EventBus.emit_signal("class_selected_signal", classes[0])


func _on_Class2_pressed():
	EventBus.emit_signal("class_selected_signal", classes[1])
