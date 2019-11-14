extends MarginContainer

var sc
var hsc
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	sc = get_node("HBoxContainer/VBoxContainer/HBoxContainer2/ScoreNum")
	hsc = get_node("HBoxContainer/VBoxContainer/HBoxContainer2/HighScoreNum")
	$HTTPRequest.request("endpoint_url", PoolStringArray(), false, HTTPClient.METHOD_GET, "username")
	
func _on_HTTPRequest_request_completed( result, response_code, headers, body ):
	var response = JSON.parse(body.get_string_from_utf8())
	sc = response.result.score
	hsc = response.result.hiscore

func _update_score(add):
	score += add
	sc.text = String(score)

