extends Node2D


# TODO: not constant in some moment
const DMG = 10


onready var _animator_player: AnimationPlayer = $AnimationPlayer


var _damaged_zombies: Array = []


func _ready() -> void:
	_animator_player.play("Slash")


func _animation_ended() -> void:
	queue_free()



func _on_Area2D_body_entered(body):
	if body.has_method("recieve_projectile_damage"):
		if !_damaged_zombies.has(body):
			body.recieve_projectile_damage(DMG)
			_damaged_zombies.append(body)
