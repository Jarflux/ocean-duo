extends Node

var nets
var plastic

func _ready():
	nets = $Nets
	plastic = $Plastic
	
func onNetAmountChanged(_old_value, new_value):
	nets.text = str(new_value)

func onPlasticAmountChanged(_old_value, new_value):
	plastic.text = str(new_value)
