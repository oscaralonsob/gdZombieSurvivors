extends KinematicBody2D


const SPEED: int = 75
const HEALTH: int = 40
const KNOCK_BACK_FORCE: int = 30


var _current_health: int = HEALTH 


# TODO: Do not like this tbh
onready var target: KinematicBody2D = get_tree().get_root().get_node("Scene").get_node("Player")


func _physics_process(_delta: float) -> void:
	_process_movement(_delta)


func _process_movement(delta: float) -> void:
	var direction: Vector2 = (target.global_position - global_position).normalized()
	var collision_info = move_and_collide(direction * SPEED * delta)
	
	look_at(target.global_position)


func _knock_back() -> void:
	var direction: Vector2 = (global_position - target.global_position).normalized()
	var collision_info = move_and_collide(direction * KNOCK_BACK_FORCE)


func recieve_damage(damage: int) -> void:
	_current_health -= damage
	
	if _current_health <= 0:
		queue_free()
	else:
		_knock_back()
