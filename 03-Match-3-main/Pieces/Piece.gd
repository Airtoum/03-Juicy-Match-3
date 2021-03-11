extends Node2D

var Scream = load("res://Sound/Scream.tscn")

export (String) var color
export (Texture) var texture
export (SpriteFrames) var spriteframes
var is_matched
var is_counted
var selected = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
export var highlight = Color(1,0.8,0,1)
var expectedposition = Vector2(0,0)

var dying = false
var deathsounds = [
	load("res://Sound/Scream1.wav"),
	load("res://Sound/Scream2.wav"),
	load("res://Sound/Scream3.wav"),
	load("res://Sound/Scream4.wav"),
	load("res://Sound/Scream5.wav"),
	load("res://Sound/Scream6.wav"),
	load("res://Sound/Scream7.wav"),
	load("res://Sound/Scream8.wav"),
	load("res://Sound/Scream9.wav"),
	load("res://Sound/Scream10.wav"),
	load("res://Sound/Scream11.wav"),
	load("res://Sound/Scream12.wav"),
]

func _ready():
	default_modulate = modulate
	if texture:
		$Sprite.texture = texture
	if spriteframes:
		$Sprite.visible = false
		$AnimatedSprite.visible = true
		$AnimatedSprite.frames = spriteframes

func _physics_process(_delta):
	if dying:
		if not $Death.is_active() and not $Scream.playing:
			queue_free()
	else:
		if selected:
			if modulate != highlight:
				modulate = highlight
			$AnimatedSprite.speed_scale = 4
		else:
			if modulate != default_modulate:
				modulate = default_modulate
			$AnimatedSprite.speed_scale = 1
		

func move_piece(change, variant):
	expectedposition += change
	if variant == "Swap":
		$Smoove.interpolate_property(self, "position", position, expectedposition, 0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT, 0)
	if variant == "Fall":
		$Smoove.interpolate_property(self, "position", position, expectedposition, 0.5, Tween.TRANS_QUAD, Tween.EASE_IN, 0)
	$Smoove.start()
	# target_position = position + change
	# position = target_position

func die():
	dying = true;
	do_the_death()
	
func do_the_death():
	$Death.interpolate_property(self, "position", position, position + Vector2(rand_range(-30, 30), 600), 0.7, Tween.TRANS_CUBIC, Tween.EASE_IN, 0)
	$Death.interpolate_property(self, "rotation", rotation, rand_range(-2 * PI, 2 * PI), 0.7, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0)
	$Death.interpolate_property(self, "scale", scale, Vector2(0.4, 0.4), 0.7, Tween.TRANS_CIRC, Tween.EASE_IN, 0)
	$Death.interpolate_property(self, "modulate:a", modulate.a, 0.0, 0.7, Tween.TRANS_QUAD, Tween.EASE_IN, 0)
	$Death.start()
	var scream = Scream.instance()
	scream.stream = deathsounds[randi() % deathsounds.size()]
	scream.pitch_scale = rand_range(0.8, 1.2)
	add_child(scream)
	get_node("/root/Game").pulse_bg(color)

func is_still_moving():
	return $Smoove.is_active()
