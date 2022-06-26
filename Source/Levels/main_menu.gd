extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var play = $Button
onready var quit = $Button2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if play.pressed:
		get_tree().change_scene("res://Source/Levels/level_intro.tscn")
	if quit.pressed:
		get_tree().quit()
