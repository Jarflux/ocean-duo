extends Node

var debug_mode
var debug_enabled = false;
var debug_keybind = "toggle_debug_mode";
var game
var btn_increase_nets
var btn_decrease_nets
var btn_increase_plastic
var btn_decrease_plastic

func _ready():
	debug_mode = $"."
	game = get_node("/root/Game")
	btn_increase_nets = $IncreaseNets
	btn_decrease_nets = $DecreaseNets
	btn_increase_plastic = $IncreasePlastic
	btn_decrease_plastic = $DecreasePlastic
	btn_increase_nets.pressed.connect(self._btnIncreaseNetAmount)
	btn_decrease_nets.pressed.connect(self._btnDecreaseNetAmount)
	btn_increase_plastic.pressed.connect(self._btnIncreasePlasticAmount)
	btn_decrease_plastic.pressed.connect(self._btnDecreasePlasticAmount)
	
func _process(delta: float):
	_move(delta)
	
func _move(_delta: float):
	if Input.is_action_just_released(debug_keybind):
		toggleDebug()
		
func toggleDebug():
	if debug_mode.visible:
		debug_mode.visible = false
	else:
		debug_mode.visible = true
	
func _btnDecreaseNetAmount():
	get_node("/root/Game/Audio/AudioManager").play("res://sounds/splash.mp3")
	game.decreaseNetAmount();

func _btnIncreaseNetAmount():
	get_node("/root/Game/Audio/AudioManager").play("res://sounds/splash.mp3")
	game.increaseNetAmount();	

func _btnDecreasePlasticAmount():
	get_node("/root/Game/Audio/AudioManager").play("res://sounds/splash.mp3")
	game.decreasePlasticAmount();

func _btnIncreasePlasticAmount():
	get_node("/root/Game/Audio/AudioManager").play("res://sounds/splash.mp3")
	game.increasePlasticAmount();	
	
	
