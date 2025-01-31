extends Node

@onready var scores = $Scores
var prefab = load("res://scenes/prefab/ScoreEntry.tscn")
var scores_dict = {"Tyler1": 599, "Thor": 475, "Sodapoppin":369, "xQc": 328, "Xaryu": 255, "Mizkif": 150, "esfand": 133, "itmeJP": 99}

func showScores(score):
	clearScores()
	scores_dict["You"] = score
	var sorted_scores = sort_dict_by_value(scores_dict)
	for high_score in sorted_scores:
		addScoreEntry(high_score, sorted_scores[high_score])

func clearScores():
	for n in scores.get_children():
		scores.remove_child(n)
		n.queue_free()

func addScoreEntry(name, score):
	var scoreEntry = prefab.instantiate()
	scoreEntry.get_node("Name").text = name + " - "
	scoreEntry.get_node("Score").text = str(score)
	if name == "You":
		scoreEntry.modulate = Color(0,1,0,1)
	scores.add_child(scoreEntry)

func sort_dict_by_value(input_dict: Dictionary) -> Dictionary:
	var sorted_array = input_dict.keys()
	sorted_array.sort_custom(func(a, b): return input_dict[a] > input_dict[b])
	var sorted_dict = {}
	for key in sorted_array:
		sorted_dict[key] = input_dict[key]
	return sorted_dict
