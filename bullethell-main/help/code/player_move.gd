extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

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

func _on_hitbox_body_entered(body:Node) -> void:
	if body.is_in_group("bullet"):
		
		print("true")
		body.queue_free()
		
