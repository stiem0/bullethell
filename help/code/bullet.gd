extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var run = 0
var distance = 20





func _physics_process(delta):
	self.position+= Vector2(0.8,0).rotated(rotation)
	if ($RayCast2D.is_colliding()):
		print("true")
	if run > 500 or ($RayCast2D.is_colliding()) : 
		 self.queue_free()
	
	run +=1


