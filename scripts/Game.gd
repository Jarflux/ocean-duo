extends Control

class_name Game

var player_net
var level1
var gui

func _ready():
	gui = $GUI
	player_net = $Net
	level1 = $"Levels/Level1"
	player_net.connect("net_amount_set", gui._on_Net_Amount_Changed)
	
func start():
	player_net.visible = true;
	level1.visible = true;
	gui.visible = true;
	
	#TODO Add start game loop
	
	
	
	
