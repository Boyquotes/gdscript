extends ColorRect

@onready var scroll_container = $ScrollContainer

@onready var create_Button := $ScrollContainer/VBoxContainer/HBoxContainer3/GridContainer/Button
@onready var personal_boards_container := $ScrollContainer/VBoxContainer/HBoxContainer3/GridContainer

var overlay = null
func _ready():
	
	for i in range(0):
		var btn_clone = create_Button.duplicate()
		btn_clone.set_text(str(i))
		personal_boards_container.add_child(btn_clone)
	
	get_tree().root.connect("size_changed", on_size_changed)

func on_size_changed():
	print("Resizing: ", get_viewport_rect().size, DisplayServer.window_get_size())
	scroll_container.set_size(DisplayServer.window_get_size())
	
func on_btn_press():
	DataRepository.create_board()
