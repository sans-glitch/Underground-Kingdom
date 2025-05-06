extends Control

var item_list : Array
@onready var label: Label = $Label

func _ready() -> void:
	update_label()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("inventory"):
		visible = !visible
	
## Adds each item to the inventory label as a new bullet point
func update_label():
	label.text = "Items: "
	for item in item_list:
		label.text += "\n - " + item

## Adds an item as a string to the item array
func add_item(item : String):
	item_list.append(item)
	update_label()

## Removes an item from the item array if it exists
func remove_item(item : String):
	item_list.erase(item)
	update_label()
