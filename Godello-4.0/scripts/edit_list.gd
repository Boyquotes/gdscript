extends ConfirmationDialog


const ACTION_DELETE_LIST = "delete_list"
const ACTION_DELETE_BOARD = "delete_board"

var board : BoardModel : set = set_board
var list : ListModel : set = set_list
var _mode = SceneUtils.InputFieldDialogMode.CREATE_LIST : set = _set_mode

@onready var input_field := $MarginContainer/TextEdit

signal hided

func _ready():
	set_hide_on_ok(false)


func _input(_event):
#	if event is InputEventKey and not event.is_pressed():
#		match event.get_keycode():
#			KEY_ESCAPE:
#				hide()
	pass


func _set_mode(value):
	_mode = value

	match _mode:
		SceneUtils.InputFieldDialogMode.EDIT_LIST:
# warning-ignore:return_value_discarded
			add_button("Delete List", true, ACTION_DELETE_LIST)
			set_title("Edit List")

		SceneUtils.InputFieldDialogMode.EDIT_BOARD:
# warning-ignore:return_value_discarded
			add_button("Delete Board", true, ACTION_DELETE_BOARD)
			set_title("Edit Board")
			input_field.set_placeholder("Board Name")

		SceneUtils.InputFieldDialogMode.CREATE_BOARD:
			set_title("Create Board")
			input_field.set_placeholder("Board Name")

		SceneUtils.InputFieldDialogMode.ADD_BOARD_MEMBER:
			set_title("Add Board Member")
			input_field.set_placeholder("Member Email")


func save():
	var _title = Utils.clean_input_text(input_field.get_text())

	if Utils.validate_not_empty_text(_title, input_field.get_placeholder(), input_field, self):
		match mode:
			SceneUtils.InputFieldDialogMode.EDIT_LIST:
				list.set_title(_title)

			SceneUtils.InputFieldDialogMode.EDIT_BOARD:
				board.set_title(_title)

			SceneUtils.InputFieldDialogMode.CREATE_LIST:
				DataRepository.create_list(board, _title)

			SceneUtils.InputFieldDialogMode.CREATE_BOARD:
				board.set_title(_title)
				DataRepository.create_board(board)

			SceneUtils.InputFieldDialogMode.ADD_BOARD_MEMBER:
				if not Utils.validate_email_field(input_field, self):
					return

				DataRepository.add_board_member(_title, board)

		hide()
		hided.emit()


func set_board(_model):
	board = _model


func set_list(_model):
	list = _model


func _on_TextEdit_gui_input(event):
	if event is InputEventKey and not event.is_pressed():
		match event.get_keycode():
			KEY_ENTER:
				save()


func _is_board_mode():
	return mode in [SceneUtils.InputFieldDialogMode.CREATE_BOARD, SceneUtils.InputFieldDialogMode.EDIT_BOARD]


func _on_InputFieldDialog_confirmed():
	save()


func _on_InputFieldDialog_about_to_show():
	match mode:
		SceneUtils.InputFieldDialogMode.EDIT_LIST:
			input_field.set_text(list.title)

		SceneUtils.InputFieldDialogMode.EDIT_BOARD:
			input_field.set_text(board.title)

		_:
			input_field.set_text("")

	await get_tree().create_timer(0.05).timeout
	input_field.grab_focus()


func _on_InputFieldDialog_custom_action(action):
	SceneUtils.create_delete_confirm_popup(self, self, [action])


func _on_delete_confirmed(_action):
	match mode:
		SceneUtils.InputFieldDialogMode.EDIT_LIST:
			DataRepository.delete_list(list)
			hide()

		SceneUtils.InputFieldDialogMode.EDIT_BOARD:
			DataRepository.delete_board(board)
			queue_free()


func _on_canceled():
	pass # Replace with function body.
