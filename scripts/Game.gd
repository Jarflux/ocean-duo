extends Control

class_name Game

signal net_amount_increased
signal net_amount_decreased
signal plastic_amount_increased
signal plastic_amount_decreased

var player_net
var level
var gui
var scores

var amount_of_nets
var amount_of_plastic_caught

func _ready():
	gui = $GUI
	level = $"Level"
	player_net = $Net
	scores = $"Score Screen"
	self.net_amount_increased.connect(gui.onNetAmountChanged);
	self.net_amount_decreased.connect(gui.onNetAmountChanged);
	self.plastic_amount_increased.connect(gui.onPlasticAmountChanged);
	self.plastic_amount_decreased.connect(gui.onPlasticAmountChanged);
	
func start():
	player_net.visible = true;
	level.visible = true;
	gui.visible = true;
	scores.visible = false;
	amount_of_nets = 5;
	setNetAmount(5);
	amount_of_plastic_caught = 0;
	setPlasticAmount(0);

func gameOver():
	scores.visible = true;
	player_net.visible = false;
	level.visible = false;
	gui.visible = false;
	clearSpawnedObjects();
	scores.showScores(amount_of_plastic_caught);

func clearSpawnedObjects():
	var spawnedObjects = get_node("/root/Game/Level/SpawnedObjects")
	for n in spawnedObjects.get_children():
		spawnedObjects.remove_child(n)
		n.queue_free()

func caughtNet():
	increaseNetAmount();
	
func caughtFish():
	decreaseNetAmount();

func caughtPlastic():
	increasePlasticAmount();

func setNetAmount(amount):
	var old_amount = amount;
	emit_signal("net_amount_increased", old_amount, amount)
	
func increaseNetAmount():
	var old_amount = amount_of_nets;
	amount_of_nets = amount_of_nets + 1;
	emit_signal("net_amount_increased", old_amount, amount_of_nets)
	
func decreaseNetAmount():
	var old_amount = amount_of_nets;
	amount_of_nets = amount_of_nets - 1;
	emit_signal("net_amount_decreased", old_amount, amount_of_nets)
	if amount_of_nets == 0:
		gameOver();

func setPlasticAmount(amount):
	var old_amount = amount;
	emit_signal("plastic_amount_increased", old_amount, amount)

func increasePlasticAmount():
	var old_amount = amount_of_plastic_caught;
	amount_of_plastic_caught = amount_of_plastic_caught + 1;
	emit_signal("plastic_amount_increased", old_amount, amount_of_plastic_caught)
	
func decreasePlasticAmount():
	var old_amount = amount_of_plastic_caught;
	amount_of_plastic_caught = amount_of_plastic_caught - 1;
	emit_signal("plastic_amount_decreased", old_amount, amount_of_plastic_caught)
