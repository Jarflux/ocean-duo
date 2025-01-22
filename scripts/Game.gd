extends Control

class_name Game

signal net_amount_increased
signal net_amount_decreased
signal plastic_amount_increased
signal plastic_amount_decreased

var player_net
var level1
var gui

var amount_of_nets
var amount_of_plastic_caught

func _ready():
	gui = $GUI
	level1 = $"Levels/Level1"
	player_net = $Net
	self.net_amount_increased.connect(gui.onNetAmountChanged);
	self.net_amount_decreased.connect(gui.onNetAmountChanged);
	self.plastic_amount_increased.connect(gui.onPlasticAmountChanged);
	self.plastic_amount_decreased.connect(gui.onPlasticAmountChanged);
	amount_of_nets = 5;
	amount_of_plastic_caught = 0;
	
func start():
	player_net.visible = true;
	level1.visible = true;
	gui.visible = true;
	#TODO Add start game loop	

func increaseNetAmount():
	var old_amount = amount_of_nets;
	amount_of_nets = amount_of_nets + 1;
	emit_signal("net_amount_increased", old_amount, amount_of_nets)
	
func decreaseNetAmount():
	var old_amount = amount_of_nets;
	amount_of_nets = amount_of_nets - 1;
	emit_signal("net_amount_decreased", old_amount, amount_of_nets)

func increasePlasticAmount():
	var old_amount = amount_of_plastic_caught;
	amount_of_plastic_caught = amount_of_plastic_caught + 1;
	emit_signal("plastic_amount_increased", old_amount, amount_of_plastic_caught)
	
func decreasePlasticAmount():
	var old_amount = amount_of_plastic_caught;
	amount_of_plastic_caught = amount_of_plastic_caught - 1;
	emit_signal("plastic_amount_decreased", old_amount, amount_of_plastic_caught)


	
	
	
	
	
	
