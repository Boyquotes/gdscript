extends MarginContainer

@onready var title_label := $CardContent/InnerPadding/VBoxContainer/TitleContainer/Title
@onready var indicators_container := $CardContent/InnerPadding/VBoxContainer/IndicatorsContainer
@onready var indicators_size_placeholder := $%SizePlaceholder
@onready var title_container := $%TitleContainer
@onready var size_placeholder0 := $%sizePlaceholder0
const StyleDefault := preload("res://assets/style_panel_card.tres")
const StuleDragged := preload("res://assets/style_panel_card_dragged.tres")

var cardPreview := preload("res://scenes/card_mouse_preview.tscn")


signal card_hover_changed(card_hover)

var is_draged = false

# Called when the node enters the scene tree for the first time.
func _ready():
#	for child in indicators_container.get_children(): # 拖的时侯让card 高度变小，有一点动画效果
#		child.set_visible(child == indicators_size_placeholder)
#	overlay.set_visible(true) # 拖的时侯让card 看起来一片空白
	#set_drag_looking(true)
	pass # Replace with function body.

func setTitle(title):
	title_label.set_text(title)

func getTitle():
	return title_label.get_text()

func _on_mouse_entered(): # 鼠标第一次移到控件上
	mouse_default_cursor_shape = CursorShape.CURSOR_IBEAM

func _on_mouse_exited():  # 鼠标离开控件
#	card_hover_changed.emit(null)
	pass
	
func _get_drag_data(_pos):
	print("## card draged")
	is_draged = true
	self.set_drag_looking(true)
	return self

func set_drag_looking(draged = false):
	for child in indicators_container.get_children(): # 拖的时侯让card 高度变小，有一点动画效果
		if draged:
			child.set_visible(child == indicators_size_placeholder) # 隐藏一部分控件
		else:
			child.set_visible(true)
	
	for child in title_container.get_children(): 
		if draged:
			child.set_visible(child == size_placeholder0) # 隐藏一部分控件
		else:
			child.set_visible(true)
		
	
	
	#overlay.set_visible(is_draged) # 拖的时侯让card 看起来一片空白

#func _can_drop_data(_pos, _data):
#	return true
#
#func _drop_data(_pos, _data):
#	print("### card droped")
#	is_draged = false
	
