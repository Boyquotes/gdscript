extends MarginContainer

@onready var title_label := $CardContent/InnerPadding/VBoxContainer/TitleContainer/Title

signal card_hover_changed(card_hover)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setTitle(title):
	title_label.set_text(title)

func getTitle():
	return title_label.get_text()

func _on_mouse_entered(): # 鼠标第一次移到控件上
	mouse_default_cursor_shape = 1
	card_hover_changed.emit(self)

func _on_mouse_exited():  # 鼠标离开控件
	card_hover_changed.emit(null)
