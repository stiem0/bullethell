extends KinematicBody2D


var rng_x = RandomNumberGenerator.new()
var rng_y = RandomNumberGenerator.new()
var velocity = Vector2()
var hp = 200
var max_hp = 200
var dead = false  
func _damage(damage):
	hp -= damage 



func _on_Area2D_body_entered(body: Node) -> void:

	if body.get_parent().is_in_group("player_bullet") : 
		
		_damage(body.get_parent().damage)
		body.get_parent().queue_free()
		if hp <= 0 and dead == false : 
			print("enemy dead")
			self.get_parent().queue_free()

#func _process(delta):
	#var vell = Vector2(rng_x.randf(),rng_y.randf())
	#vell.normalized()
	#vell = move_and_slide(vell)
	#print(rng.randf())
	#var saved_state = rng.state # Store current state.
	#print(rng.randf()) # Advance internal state.
	#rng.state = saved_state # Restore the state.
	#print(rng.randf())
