extends KinematicBody2D


const SPEED = 300


func _ready() -> void:
	scale = Vector2(0.5, 0.5)


func _physics_process(_delta: float) -> void:
	_process_movement(_delta)


func _process_movement(delta: float) -> void:
	var collision_info = move_and_collide(global_transform.x * SPEED * delta)
