extends Node

var level_1_corrupted = false
var level_2_corrupted = false
var corruptions = 0

func corrupt_level(level_name):
	match level_name:
		"level_1":
			level_1_corrupted = true
		"level_2":
			level_1_corrupted = true

func is_level_corrupted(level_name):
	match level_name:
		"level_1":
			return true if level_1_corrupted else false
		"level_2":
			return true if level_2_corrupted else false
