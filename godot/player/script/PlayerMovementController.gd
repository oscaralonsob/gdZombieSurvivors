extends KinematicBody2D


const SPEED = 150


onready var _animated_sprite = $AnimatedSprite


func _physics_process(_delta: float) -> void:
	_process_input(_delta)


func _process_input(delta: float) -> void:
	var vector_movement: Vector2 = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		vector_movement.x += 1
	if Input.is_action_pressed("ui_left"):
		vector_movement.x -= 1
	if Input.is_action_pressed("ui_up"):
		vector_movement.y -= 1
	if Input.is_action_pressed("ui_down"):
		vector_movement.y += 1
	
	
	if vector_movement != Vector2.ZERO:
		_animated_sprite.play("Walk")
	else:
		_animated_sprite.play("Idle")
	
	_process_movement(vector_movement, delta)
	_process_rotation()


func _process_movement(movement_vector: Vector2, delta: float) -> void:
	var collision_info = move_and_collide(movement_vector * SPEED * delta)


func _process_rotation() -> void:
	look_at(get_global_mouse_position())
