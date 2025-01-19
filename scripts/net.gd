extends Node

signal net_amount_set
signal net_amount_decreased
signal plastic_caught_increased

var amount_of_nets
var amount_of_plastic_caught

func _ready():
	amount_of_nets = 5;
	amount_of_plastic_caught = 0;

func setAmountOfNets(amount):
	var old_amount = amount_of_nets;
	amount_of_nets = amount
	emit_signal("net_amount_set", old_amount, amount_of_nets)
	
func decreaseNetAmount():
	var old_amount = amount_of_nets;
	amount_of_nets = amount_of_nets - 1;
	emit_signal("net_amount_decreased", old_amount, amount_of_nets)

func increasePlasticCaught():
	var old_amount = amount_of_plastic_caught;
	amount_of_plastic_caught = amount_of_plastic_caught + 1;
	emit_signal("plastic_caught_increased", old_amount, amount_of_plastic_caught)
	
	
	
