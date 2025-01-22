extends RigidBody2D

@export var button_move_left = ""
@export var button_move_right = ""
@export var button_move_up = ""
@export var button_move_down = ""

@onready var move_force_factor = 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move(delta)
	
func _move(delta: float):
	if Input.is_action_pressed(button_move_left):
		position.x -= move_force_factor * delta
	if Input.is_action_pressed(button_move_right):
		position.x += move_force_factor * delta
	if Input.is_action_pressed(button_move_up):
		position.y -= move_force_factor * delta
	if Input.is_action_pressed(button_move_down):
		position.y += move_force_factor * delta
		
