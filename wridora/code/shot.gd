extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_scene = load ("res://scene/turning_bullet.tscn")
var _timer = null
var movement = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.5)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	var repeat = 0 
	while repeat <= 8 :
		var b= bullet_scene.instance()
		b.position =  self.position
		b.rotation_degrees = (repeat * 360/8) +  self.rotation_degrees
		get_parent().add_child(b)
		repeat += 1
	
func _process(delta):
	rotate(0.005)

