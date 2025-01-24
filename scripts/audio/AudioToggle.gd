extends TextureButton

@export var audio_bus_name : String
var enabled = true;

func _pressed():
	if enabled:
		enabled = false
	else:
		enabled = true
	$Cross.visible = not enabled
	var bus_idx = AudioServer.get_bus_index(audio_bus_name)
	AudioServer.set_bus_mute(bus_idx, not enabled)	
