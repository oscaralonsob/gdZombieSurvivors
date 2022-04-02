extends KinematicBody2D


const SPEED = 300

# TODO: not constant in some moment
const DMG = 10


func _ready() -> void:
	scale = Vector2(0.5, 0.5)


func _physics_process(_delta: float) -> void:
	_process_movement(_delta)


func _process_movement(delta: float) -> void:
	var collision_info: KinematicCollision2D  = move_and_collide(global_transform.x * SPEED * delta)
	
	if collision_info != null:
		_execute_collision(collision_info)


func _execute_collision(collision: KinematicCollision2D ) -> void:
	if collision.collider.has_method("recieve_damage"):
		collision.collider.recieve_damage(DMG)
		
	queue_free()
	
