extends Projectile


var damage = 0
var knock_back_force = 0


onready var _animator_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	_animator_player.play("Slash")


func _animation_ended() -> void:
	queue_free()
