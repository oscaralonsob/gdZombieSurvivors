extends Node2D

signal scene_fully_loaded_signal()


# UI events
signal ui_profession_selected_signal(class_selected)


# Game events
signal player_health_updated_signal(health, max_health)
signal profession_updated_signal(class_selected)

# Exp related
signal exp_picked_up_signal()
signal exp_updated_signal(expirence, max_expirence)
signal level_up_signal()
