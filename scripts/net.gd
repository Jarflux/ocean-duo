extends Node

var line_between_points
var left
var right
var netArea
var collider
var game

func _ready():
	line_between_points = $LineBetweenPoints
	netArea = $Area2D
	collider = $Area2D/collider
	left = $Left
	right = $Right
	game = get_node("/root/Game")
	netArea.body_entered.connect(self.onCatch);
	
func _process(_delta: float) -> void:
	line_between_points.clear_points()
	line_between_points.add_point(left.position)
	line_between_points.add_point(right.position)
	collider.shape.a = left.position
	collider.shape.b = right.position

func onCatch(other):
	if other.get_meta("class") == "Fish":
		print("Caught a Fish")
		game.caughtFish()
	if other.get_meta("class") == "Plastic":	
		print("Caught a Plastic")
		game.caughtPlastic()
	other.queue_free()
