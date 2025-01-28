extends Node

@export var spawn_area_min_X : float
@export var spawn_area_max_X : float
@export var spawn_area_min_Y : float
@export var spawn_area_max_Y : float
@export var fish_or_plastic : int
@export var flipped : bool
@export var velocity : Vector2
@export var spawn_threshold : float # number between 0 and 1

var fish = load("res://scenes/prefab/Fish.tscn")
var plastic = load("res://scenes/prefab/Plastic.tscn")

var rng = RandomNumberGenerator.new()
	
func _process(float) -> void:
	if self.get_parent().get_parent().visible:
		# Decide if to spawn object
		if rng.randf() > spawn_threshold:
			# Decide where to spawn
			var x = rng.randf_range(spawn_area_min_X, spawn_area_max_X);
			var y = rng.randf_range(spawn_area_min_Y, spawn_area_max_Y);
			# Instantiate Object
			var spawned
			if fish_or_plastic == 0:
				spawned = plastic.instantiate()
				spawned.set_meta("class","Plastic")
			if fish_or_plastic == 1:
				spawned = fish.instantiate()
				spawned.set_meta("class","Fish")
			add_child(spawned)
			# Set speed and direction
			spawned.set_linear_velocity(velocity)
			spawned.position = Vector2(x,y)
			if flipped:
				spawned.get_node("AnimatedSprite2D").set_flip_h(true);

		
		
	
	
