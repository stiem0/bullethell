extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_scene = load ("res://scene/player_bullet.tscn")
var _timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()




func _process(delta):
	look_at(get_global_mouse_position())


func _on_Timer_timeout():
	if Input.is_action_pressed("L_mouse"):
		var b= bullet_scene.instance()
		b.position = self.get_parent().position
		b.rotation = self.rotation
		get_parent().get_parent().get_parent().add_child(b)	
	else :
		self.rotation = get_parent().rotation
		
		
	
