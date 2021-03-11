extends Node2D


var currentcolor
var attractorcolor

# Called when the node enters the scene tree for the first time.
func _ready():
	attractorcolor = $BG.color
	currentcolor = attractorcolor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$BG.color = currentcolor
	currentcolor = scale_color(currentcolor, 0.8) + scale_color(attractorcolor, 0.2)

func pulse_bg(color):
	if color == "Red":
		currentcolor.r += 0.2
	if color == "Green":
		currentcolor.g += 0.2
	if color == "Blue":
		currentcolor.b += 0.2
	if color == "Magenta":
		currentcolor.r += 0.2
		currentcolor.b += 0.2
		
func scale_color(color, multiplier):
	return Color(color.r * multiplier, color.g * multiplier, color.b * multiplier, 1)
