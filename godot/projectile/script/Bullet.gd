extends Projectile


const SPEED = 300


func _ready() -> void:
	scale = Vector2(0.5, 0.5)


func _physics_process(_delta: float) -> void:
	_process_movement(_delta)


func _process_movement(delta: float) -> void:
	translate(global_transform.x * SPEED * delta)


func _on_Area2D_body_entered(body):
	._on_Area2D_body_entered(body)
	queue_free()
