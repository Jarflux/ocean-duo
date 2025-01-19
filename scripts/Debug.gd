extends Node

var debug_mode
var debug_enabled = false;
var debug_keybind = "toggle_debug_mode";

func _ready():
	debug_mode = $"."
	
func _process(delta: float):
	_move(delta)
	
func _move(delta: float):
	if Input.is_action_just_released(debug_keybind):
		toggleDebug()
		
func toggleDebug():
	if debug_mode.visible:
		debug_mode.visible = false
	else:
		debug_mode.visible = true
