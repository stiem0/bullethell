extends ProgressBar





func _process(delta):
	var hp = self.get_parent().get("hp") 
	var max_hp = get_parent().get("max_hp")
	self.max_value = max_hp
	self.value = hp


