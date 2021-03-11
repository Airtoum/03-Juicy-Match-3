extends Control

export (String) var nextlevel

func _ready():
	var _changed = Global.connect("changed",self,"_on_score_changed")
	_on_score_changed()

func _on_score_changed():
	$Score.text = "Score: " + str(Global.score) + " / 500"
	if Global.score >= 500:
		$Button.visible = true


func _on_Button_pressed():
	Global.score = 0
	get_tree().change_scene(nextlevel)
