extends Node

@export var spawn_area_min_X : float
@export var spawn_area_max_X : float
@export var spawn_area_min_Y : float
@export var spawn_area_max_Y : float
@export var fish_or_plastic : int
@export var flipped : bool
@export var spawn_threshold : float # number between 0 and 1

var fish1 = load("res://scenes/prefab/FishExotic.tscn")
var fish2 = load("res://scenes/prefab/FishClown.tscn")
var fish3 = load("res://scenes/prefab/FishShark.tscn")
var crab = load("res://scenes/prefab/Crab.tscn")
var knife = load("res://scenes/prefab/Knife.tscn")
var net = load("res://scenes/prefab/Net.tscn")
var plastic1 = load("res://scenes/prefab/PlasticBottle.tscn")
var plastic2 = load("res://scenes/prefab/PlasticBeer.tscn")
var plastic3 = load("res://scenes/prefab/PlasticBag.tscn")
var spawnedObjects 
var netCounter = 0;

var rng = RandomNumberGenerator.new()

func _ready():
	spawnedObjects = get_node("/root/Game/Level/SpawnedObjects")
	
func _process(float) -> void:
	netCounter = netCounter + 1;
	if self.get_parent().get_parent().visible:
		# Decide if to spawn object
		if rng.randf() > spawn_threshold:
			# Decide where to spawn
			var x = rng.randi_range(spawn_area_min_X, spawn_area_max_X);
			var y = rng.randi_range(spawn_area_min_Y, spawn_area_max_Y);
			# Instantiate Object
			var spawned
			if fish_or_plastic == 0:
				spawned = _createPlastic()
			if fish_or_plastic == 1:
				spawned = _createFish()
			if fish_or_plastic == 2:
				spawned = _createCrab()
			spawnedObjects.add_child(spawned)
			spawned.position = Vector2(x,y)
			if flipped:
				spawned.set_linear_velocity(Vector2(-spawned.linear_velocity.x, -spawned.linear_velocity.y))
				spawned.get_node("AnimatedSprite2D").set_flip_h(true);

func _createPlastic():
	var spawned
	var selector = rng.randf_range(0,1)
	if  selector > 0 && selector <= 0.25:
		spawned = plastic1.instantiate()
		spawned.set_meta("class","Plastic")
	if  selector > 0.25 && selector <= 0.50:
		spawned = plastic2.instantiate()
		spawned.set_meta("class","Plastic")
	if  selector > 0.50 && selector <= 0.75:
		spawned = plastic3.instantiate()
		spawned.set_meta("class","Plastic")
	if selector > 0.75 && selector <= 0.98:
		spawned = knife.instantiate()
		spawned.set_meta("class","Fish")
	if selector > 0.98:
		if netCounter > 3600:
			netCounter = 0;
			spawned = net.instantiate()
			spawned.set_meta("class","Net")
		else:
			spawned = plastic3.instantiate()
			spawned.set_meta("class","Plastic")
	return spawned
	
func _createFish():	
	var spawned
	var selector = rng.randi_range(0,2)
	if selector == 0:
		spawned = fish1.instantiate()
	if selector == 1:
		spawned = fish2.instantiate()
	if selector == 2:
		spawned = fish3.instantiate()	
	spawned.set_meta("class","Fish")
	return spawned
	
func _createCrab():	
	var spawned = crab.instantiate()
	spawned.set_meta("class","Fish")
	return spawned
		
	
	
