extends Node

var line_between_points
var left
var right

func _ready():
	line_between_points = $LineBetweenPoints
	left = $Left
	right = $Right
	
func _process(_delta: float) -> void:
	line_between_points.clear_points()
	line_between_points.add_point(left.position)
	line_between_points.add_point(right.position)
	
	
	
