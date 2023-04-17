extends MarginContainer

@onready var title_label := $CardContent/InnerPadding/VBoxContainer/TitleContainer/Title
var cardPreview := preload("res://scenes/card_mouse_preview.tscn")

signal card_hover_changed(card_hover)

var is_draged = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setTitle(title):
	title_label.set_text(title)

func getTitle():
	return title_label.get_text()

func _on_mouse_entered(): # 鼠标第一次移到控件上
	mouse_default_cursor_shape = CursorShape.CURSOR_IBEAM

func _on_mouse_exited():  # 鼠标离开控件
	card_hover_changed.emit(null)
	
func _get_drag_data(_pos):
	print("## card draged")
	is_draged = true
	return self
	
#func _can_drop_data(_pos, _data):
#	return true
#
#func _drop_data(_pos, _data):
#	print("### card droped")
#	is_draged = false
	
