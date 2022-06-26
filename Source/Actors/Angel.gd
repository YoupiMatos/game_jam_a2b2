extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var dialogue = $Label
const magic_boots = preload("res://Source/Items/MagicBoots.tscn")
var level_name: String
var boots: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	level_name = get_tree().get_current_scene().get_name()
	boots = magic_boots.instance()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DialogueBox_body_entered(body):
	match level_name:
		"level_1":
			dialogue.text = "You've been good to the plants. Take this :"
			get_parent().add_child(boots)
			
