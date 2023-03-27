extends ColorRect

@onready var scroll_container = $ScrollContainer

@onready var create_Button := $ScrollContainer/VBoxContainer/HBoxContainer3/GridContainer/Button
@onready var personal_boards_container := $ScrollContainer/VBoxContainer/HBoxContainer3/GridContainer


const BoardCard := preload("res://scenes/board_card.tscn")
const InputFieldDialog := preload("res://scenes/InputFieldDialog.tscn")

const Board := preload("res://scenes/board.tscn")

var board = null
func _ready():
	
#	var board_card = BoardCard.instantiate()
#	var label =  board_card.get_node("Label")
#	label.add_theme_font_size_override("font_size", 32)
#	label.add_theme_color_override("font_color", Color(100, 100, 100, 0.5))
#	label.text = "111111"
#
#	personal_boards_container.add_child(board_card)
#	personal_boards_container.move_child(board_card, 0)
	
	for i in range(0):
		var btn_clone = create_Button.duplicate()
		btn_clone.set_text(str(i))
		personal_boards_container.add_child(btn_clone)
		personal_boards_container.move_child(btn_clone, 0)

	
	get_tree().root.connect("size_changed", on_size_changed)

func on_size_changed():
	print("Resizing: ", get_viewport_rect().size, DisplayServer.window_get_size())
	scroll_container.set_size(DisplayServer.window_get_size())
	
func on_btn_press():
	DataRepository.create_board_card()
	var input = InputFieldDialog.instantiate()
	scroll_container.add_child(input)
	var name_card = await  DataRepository.board_card_name_get
		# 等一个完成信号, 用户正确输入了卡片名
	if name_card == "":
		return DataRepository.create_board_card_done()
	
	var board_card = BoardCard.instantiate()
	var label =  board_card.get_node("Label")
	label.add_theme_font_size_override("font_size", 32)
	label.add_theme_color_override("font_color", Color(100, 100, 100, 0.5))
	label.text = name_card
	
	var callable = Callable(self, "on_buttn_click").bind(board_card)
	board_card.connect("pressed", callable)
	
	var t = board_card.get_node("Label").text

#	board_card.pressed.connect(on_buttn_click)

	personal_boards_container.add_child(board_card)
	personal_boards_container.move_child(board_card, 0)
		
	DataRepository.create_board_card_done()

func on_buttn_click(sender):
	var t = sender.get_node("Label").text
	
	if board:
		board.free()
	
	# 实例化一个场景，然后传给主场景，让它加入自已的 child
	board = Board.instantiate()
	
	DataRepository.switch_Scene(sender, board)
	pass

