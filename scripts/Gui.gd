extends Node

var nets

func _ready():
	nets = $Nets
	
func _on_Net_Amount_Changed(old_value, new_value):
	nets.text = str(new_value)
