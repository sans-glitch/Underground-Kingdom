extends Node

var curr_level = 1

## Increases the current level counter by one
func increase_level_num():
	curr_level += 1

## Loads the current level from the level folder.
## Level name must follow "level_" + NUM
func load_current_level():
	var level_name = "res://scenes/levels/level_" + str(curr_level) + ".tscn"
	var level = load(level_name)
	if level:
		get_tree().change_scene_to_packed(level)
	else:
		get_tree().change_scene_to_file("res://scenes/end.tscn")

## Increases the level number and loads the new level
func progress_level():
	increase_level_num()
	load_current_level()
