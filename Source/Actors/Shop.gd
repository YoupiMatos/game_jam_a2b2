extends Area2D


# Declare member variables here. Examples:
onready var anim_player = $AnimationPlayer
onready var dialogue = $Dialogue
var player_is_near = false
var level_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	level_name = get_tree().get_current_scene().get_name()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_is_near && Input.is_action_just_pressed("accept"):
		if !Autoload.is_level_corrupted(level_name):
			Autoload.corrupt_level(level_name)
			Autoload.corruptions += 1
			print(level_name)


func _on_Shop_body_entered(body):
	if body.is_in_group("player"):
		if dialogue.percent_visible != 1:
			anim_player.play("dialogue")
		player_is_near = true


func _on_Shop_body_exited(body):
	if body.is_in_group("player"):
		player_is_near = false
