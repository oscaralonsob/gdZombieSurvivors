extends KinematicBody2D

onready var _animated_sprite: AnimatedSprite = $AnimatedSprite
onready var _immunity_timer: TimerHelper = preload("res://helper/scene/TimerHelper.tscn").instance()


var _health: float = -1
var _is_immune: bool = false


var _profession: ProfessionContainer = null


func _ready() -> void:
	var _connect_result: int = 0
	_connect_result = EventBus.connect("ui_profession_selected_signal", self, "_class_selected")
	_connect_result = EventBus.connect("level_up_signal", self, "_level_up")
	_immunity_timer.init(0.5, self, "disable_immunity")


#-----------------------------------------------------------------------------
# Start class and level related
#-----------------------------------------------------------------------------
func _class_selected(profession: ProfessionContainer) -> void:
	_profession = profession
	_set_health()
	_add_weapon()

	EventBus.emit_signal("player_health_updated_signal", _health, _profession.get_health().get_value())


func _set_health() -> void:
	_health = _profession.get_health().get_value()


func _add_weapon() -> void:
	var _weapon: Weapon = _profession.get_weapon_scene().instance()
	self.add_child(_weapon)


func _level_up(level: int) -> void:
	# TODO: At some point, enable the selection menu an allow the player to select the perk, like the class
	print("Level up to: ", level)
	_profession.add_random_perk()

	EventBus.emit_signal("player_health_updated_signal", _health, _profession.get_health().get_value())
#-----------------------------------------------------------------------------
# End class and level related
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Start movement and handling input related
#-----------------------------------------------------------------------------
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
	var _collision_info = move_and_collide(vector_movement * _profession.get_speed().get_value() * delta)
	
	if vector_movement != Vector2.ZERO:
		_animated_sprite.play("Walk")
	else:
		_animated_sprite.play("Idle")


func _process_rotation() -> void:
	look_at(get_global_mouse_position())
#-----------------------------------------------------------------------------
# End movement and handling input related
#-----------------------------------------------------------------------------


#-----------------------------------------------------------------------------
# Start damage related
#-----------------------------------------------------------------------------
func recieve_zombie_damage(damage: int) -> void:
	if !_is_immune:
		_health -= damage
		EventBus.emit_signal("player_health_updated_signal", _health, _profession.get_speed().get_value())
		enable_immunity()
		
		if _health <= 0:
			queue_free()


func enable_immunity() -> void:
	_is_immune = true
	_immunity_timer.reset()


func disable_immunity() -> void:
	_is_immune = false
#-----------------------------------------------------------------------------
# End damage related
#-----------------------------------------------------------------------------