extends Node

var level_1_corrupted = false
var corruptions = 0

func corrupt_level(level_name):
	match level_name:
		"level_1":
			level_1_corrupted = true

func is_level_corrupted(level_name):
	match level_name:
		"level_1":
			return true if level_1_corrupted else false
