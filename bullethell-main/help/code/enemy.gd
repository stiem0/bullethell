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
	_timer.set_wait_time(0.05)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	var b= bullet_scene.instance()
	b.position = self.position
	b.rotation = self.rotation

	get_parent().add_child(b)
func _process(delta):
	rotate(0.05)


