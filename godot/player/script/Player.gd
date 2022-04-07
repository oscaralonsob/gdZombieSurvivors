extends KinematicBody2D


const SPEED: int = 150
const HEALTH: int = 100


export(PackedScene) var bullet_scene


onready var _gun_position: Position2D = $GunPosition
onready var _animated_sprite: AnimatedSprite = $AnimatedSprite


# TODO: add cd damage like 0.1s
var _current_health: int = HEALTH
var _inmunity_cd: float = 0.5
var _inmunity_timer: float = 0



func _unhandled_input(event) -> void:
	if event.is_action_released("ui_shoot"):
		_shoot()


func _physics_process(delta: float) -> void:
	var vector_movement: Vector2 = _get_movement_input()
	_process_movement(vector_movement, delta)
	_process_rotation()
	_update_inmunity_cd(delta)


func _get_movement_input() -> Vector2:
	var vector_movement: Vector2 = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		vector_movement.x += 1
	if Input.is_action_pressed("ui_left"):
		vector_movement.x -= 1
	if Input.is_action_pressed("ui_up"):
		vector_movement.y -= 1
	if Input.is_action_pressed("ui_down"):
		vector_movement.y += 1
	
	return vector_movement;


func _process_movement(vector_movement: Vector2, delta: float) -> void:
	var collision_info = move_and_collide(vector_movement * SPEED * delta)
	
	if vector_movement != Vector2.ZERO:
		_animated_sprite.play("Walk")
	else:
		_animated_sprite.play("Idle")


func _process_rotation() -> void:
	look_at(get_global_mouse_position())


func _shoot() -> void:
	var bullet: Node2D = bullet_scene.instance()
	get_parent().add_child(bullet)
	bullet.global_rotation = _gun_position.global_rotation
	bullet.global_position = _gun_position.global_position


func _update_inmunity_cd(delta: float) -> void:
	if _is_in_damage_cd():
		_inmunity_timer -= delta


func _is_in_damage_cd() -> bool:
	return _inmunity_timer > 0


func recieve_zombie_damage(damage: int) -> void:
	if !_is_in_damage_cd():
		_inmunity_timer = _inmunity_cd
		_current_health -= damage
		
		if _current_health <= 0:
			queue_free()
