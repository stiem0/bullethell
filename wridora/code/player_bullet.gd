extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var run = 0
var distance = 20
var damage = 20




func _physics_process(delta):
	self.position+= Vector2(2.2,0).rotated(rotation)

	if run > 200  : 
		 self.queue_free()
	
	run +=1
