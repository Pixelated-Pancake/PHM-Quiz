# I have no idea wat extends Control means and I'm too lazy to look it up. I just think its the node type of the script

extends Control

# Variabless

var questions = []
var current_question = 0
var score = 0
var answered = false

# Question bank (wierd term) and calling the function

func _ready():
	questions = [
		{
			"question": "Who is the main character in Project Hail Mary?",
			"options": ["Rocky", "Ryland Grace", "Ava Stratt", "Olesya Ilyukhina"],
			"correct": 1
		},
		{
			"question": "What is the name of the star that does not get affected by Astrophage?",
			"options": ["Alpha Centauri", "Tau Ceti", "Sol", "Kelper B"],
			"correct": 1
		},
		{
			"question": "What was the the microorganism that was discovered on the Petrova Line?",
			"options": ["Taumoeba", "Eridian", "Astrophage", "Ceti"],
			"correct": 2
		},
		{
			"question": "Who leads the team who try to investigate Astrophage?",
			"options":["Ava Stratt", "Carl", "Rocky", "Ryland"],
			"correct": 0
		}
	]
	
	load_question()
	
# load_question displays the respective options on their respective buttons
	
func load_question():
	var question_data = questions[current_question]
	
	$MarginContainer/MainLayout/QuestionLabel.text = question_data["question"]
	
	$MarginContainer/MainLayout/AnswersContainer/AnswerA.text = question_data["options"][0]
	
	$MarginContainer/MainLayout/AnswersContainer/AnswerB.text = question_data["options"][1]
	
	$MarginContainer/MainLayout/AnswersContainer/AnswerC.text = question_data["options"][2]
	
	$MarginContainer/MainLayout/AnswersContainer/AnswerD.text = question_data["options"][3]
	
	# Enabling buttons cuz we disable it for prev question
	
	$MarginContainer/MainLayout/AnswersContainer/AnswerA.disabled = false
	
	$MarginContainer/MainLayout/AnswersContainer/AnswerB.disabled = false
	
	$MarginContainer/MainLayout/AnswersContainer/AnswerC.disabled = false
	
	$MarginContainer/MainLayout/AnswersContainer/AnswerD.disabled = false
	
	
# -------------------------------------------------------------------------------

# So uh this is for checking if the button the player presseed is correct or not

func _on_answer_a_pressed():
	check_answer(0)
	
func _on_answer_b_pressed():
	check_answer(1)
	
func _on_answer_c_pressed():
	check_answer(2)

func _on_answer_d_pressed():
	check_answer(3)

	
# This part checks if selected answer is right or wrong. It uses the check_answer thingy
	
func check_answer(selected_answer):
	
	# if condition checks if the player answered or not
	
	if answered:
		return
		
	answered = true
	
	# this part checks if answer was correct
	
	var question_data = questions[current_question]
	
	if selected_answer == question_data["correct"]:
		$MarginContainer/MainLayout/FeedbackLabel.text = "Correct!"
		score += 1
		
	else:
		$MarginContainer/MainLayout/FeedbackLabel.text = "Wrong :("
		
	# Disablineg buttons so the player cant change an answer once clicked
		
	$MarginContainer/MainLayout/AnswersContainer/AnswerA.disabled = true
	$MarginContainer/MainLayout/AnswersContainer/AnswerB.disabled = true
	$MarginContainer/MainLayout/AnswersContainer/AnswerC.disabled = true
	$MarginContainer/MainLayout/AnswersContainer/AnswerD.disabled = true


func _on_next_button_pressed():
	current_question += 1
	
	if current_question >= questions.size():
		print("Quiz completed!")
		get_tree().change_scene_to_file("res://Scenes/ResultsScreen.tscn")
		return
	
	answered = false
	load_question()
	
	
