extends AudioStreamPlayer

func _ready():
	self.play()

func _on_finished():
	self.play()
