extends Node2D

@export var button_move_left = ""
@export var button_move_right = ""
@export var button_move_up = ""
@export var button_move_down = ""

@onready var move_force_factor = 150
var tutorial : TextureRect
var tutorial_alpha : float

func _ready():
	tutorial = $Tutorial;
	tutorial_alpha = 1;
	
func _process(delta: float) -> void:
	_move(delta)
	
func _move(delta: float):
	if Input.is_action_pressed(button_move_left):
		position.x -= move_force_factor * delta
		_fade_out_tutorial()
	if Input.is_action_pressed(button_move_right):
		position.x += move_force_factor * delta
		_fade_out_tutorial()
	if Input.is_action_pressed(button_move_up):
		position.y -= move_force_factor * delta
		_fade_out_tutorial()
	if Input.is_action_pressed(button_move_down):
		position.y += move_force_factor * delta
		_fade_out_tutorial()

func _fade_out_tutorial():	
	if(tutorial_alpha > 0):
		tutorial_alpha = tutorial_alpha - 0.01;
		tutorial.self_modulate = Color(1,1,1,tutorial_alpha);
			
	
