extends Node2D


const SPEED = 300

# TODO: not constant in some moment
const DMG = 10


func _ready() -> void:
	scale = Vector2(0.5, 0.5)


func _physics_process(_delta: float) -> void:
	_process_movement(_delta)


func _process_movement(delta: float) -> void:
	translate(global_transform.x * SPEED * delta)


func _on_Area2D_body_entered(body):
	if body.has_method("recieve_projectile_damage"):
		body.recieve_projectile_damage(DMG)
		
	queue_free()
