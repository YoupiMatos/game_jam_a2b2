extends Node

var level_1_corrupted = false
var level_2_corrupted = false
var level_3_corrupted = false
var level_4_corrupted = false
var corruptions = 0
var has_magic_boots = false

func corrupt_level(level_name):
	match level_name:
		"level_1":
			level_1_corrupted = true
		"level_2":
			level_2_corrupted = true
		"level_3":
			level_3_corrupted = true
		"level_4":
			level_4_corrupted = true

func is_level_corrupted(level_name):
	match level_name:
		"level_1":
			return true if level_1_corrupted else false
		"level_2":
			return true if level_2_corrupted else false
		"level_3":
			return true if level_3_corrupted else false
		"level_4":
			return true if level_4_corrupted else false
