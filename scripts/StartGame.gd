extends Button

func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	var title = get_node("/root/Game/Title Screen")
	title.visible = false;

	var game = get_node("/root/Game")
	game.start()
	
	#TODO Start button sound
	#get_node("/root/Audio/AudioManager").play("res://sounds/paper-crumple-short.mp3")
	
