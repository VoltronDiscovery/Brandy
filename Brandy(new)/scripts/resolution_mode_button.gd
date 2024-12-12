extends Control

# Called when the node enters the scene tree for the first time.
@onready var option_button = $HBoxContainer/OptionButton as OptionButton

# resolution dictionary
const RESOLUTION_DICTIONARY : Dictionary = {
	"1152 x 648" : Vector2i(1152, 648),
	"1280 x 720" : Vector2i(1280, 720),
	"1920 x 1080" : Vector2i(1920, 1080)
}

func _ready():
	add_resolution_items()
	
func add_resolution_items() -> void:
	for resolution_size_text in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_size_text)

# resolution screen sizes 
func _on_option_button_item_selected(index):
	var current_select = index
	
	if current_select == 0:
		DisplayServer.window_set_size(Vector2(1152, 648))
	if current_select == 1:
		DisplayServer.window_set_size(Vector2(1280, 720))
	if current_select == 2:
		DisplayServer.window_set_size(Vector2(1920, 1080))
	
