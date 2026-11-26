extends Control

var final_score = 0
var total_questions = 10

func _ready():
	
	final_score = get_tree().get_meta("final_score")
	
	$CenterContainer/MainLayout/ScoreLabel.text = "Score: " + str(final_score) + " / " + str(total_questions)
	
	var percentage = (float(final_score) / total_questions) * 100
	
	$CenterContainer/MainLayout/PercentageLabel.text = "You scored " + str(int(percentage)) + "%"
	
	


func _on_home_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/homescreen.tscn")
