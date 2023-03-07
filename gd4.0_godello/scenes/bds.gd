extends ColorRect

@onready var scroll_container = $ScrollContainer

func _ready():
	get_tree().root.connect("size_changed", on_size_changed)

func on_size_changed():
	print("Resizing: ", get_viewport_rect().size, DisplayServer.window_get_size())
	scroll_container.set_size(DisplayServer.window_get_size())

