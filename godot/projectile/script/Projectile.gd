extends Node2D
class_name Projectile


var base_damage = 0
var base_knock_back_force = 0


var _affected_bodies: Array = []


func _on_Area2D_body_entered(body):
	if !_affected_bodies.has(body):
		_affected_bodies.append(body)
		
		if body.has_method("recieve_projectile_damage"):
			body.recieve_projectile_damage(base_damage)
		
		if body.has_method("knock_back"):
			body.knock_back(base_knock_back_force)
