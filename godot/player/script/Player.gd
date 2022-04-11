extends KinematicBody2D


const SPEED: int = 150
const HEALTH: int = 100


onready var _animated_sprite: AnimatedSprite = $AnimatedSprite
onready var _immunity_timer: TimerHelper = preload("res://helper/scene/TimerHelper.tscn").instance()


var _current_health: int = HEALTH
var _is_immune: bool = false


func _ready() -> void:
	_immunity_timer.init(0.5, self, "disable_immunity")


func _physics_process(delta: float) -> void:
	var vector_movement: Vector2 = _get_movement_input()
	_process_movement(vector_movement, delta)
	_process_rotation()


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


func recieve_zombie_damage(damage: int) -> void:
	if !_is_immune:
		_current_health -= damage
		enable_immunity()
		
		if _current_health <= 0:
			queue_free()
		
		print(_current_health, "/", HEALTH)


func enable_immunity() -> void:
	_is_immune = true
	_immunity_timer.reset()


func disable_immunity() -> void:
	_is_immune = false

