extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_scene = load ("res://scene/bullet.tscn")
var _timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(0.3)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	var b= bullet_scene.instance()
	b.position = self.position
	b.rotation = self.rotation
	
	var b1= bullet_scene.instance()
	b1.position = self.position
	b1.rotation = 4.71239+self.rotation
	
	
	var b2= bullet_scene.instance()
	b2.position = self.position
	b2.rotation = 3.14159+self.rotation
	
	
	var b3= bullet_scene.instance()
	b3.position = self.position
	b3.rotation = 1.5708 +self.rotation
	
	

	get_parent().add_child(b)
	get_parent().add_child(b1)
	get_parent().add_child(b2)
	get_parent().add_child(b3)
func _process(delta):
	rotate(0.005)


