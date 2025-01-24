extends Button

func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	var title = get_node("/root/Game/Title Screen")
	title.visible = false;

	var game = get_node("/root/Game")
	game.start()
	
	get_node("/root/Game/Audio/AudioManager").play("res://sounds/splash.mp3")
	
