extends KinematicBody2D

export (int) var speed = 150

var velocity = Vector2()
var health = 200
var game_over = load ("res://scene/game_over.tscn")
var dead = false 

func _damage(damage):
	health -= damage 

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _process(delta):
	get_input()

	velocity = move_and_slide(velocity)

func _on_Area2D_body_entered(body: Node) -> void:

	if body.get_parent().is_in_group("Bullet") : 
		
		_damage(body.get_parent().damage)
		print(health)
		body.get_parent().queue_free()
		if health < 0 and dead == false : 
			print("game over")
			var b= game_over.instance()
			b.position = self.position
			add_child(b)
			dead = true 
			
