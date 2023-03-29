extends Button


var model : BoardModel : get = get_model, set = set_model

@onready var title_label := $Title


func _ready():
# warning-ignore:return_value_discarded
	DataRepository.connect("board_deleted",Callable(self,"_on_board_deleted"))


func set_model(_model : BoardModel):
	model = _model
	title_label.set_text(model.title)


func get_model():
	return model


func _on_board_deleted(board):
	if model and board.id == model.id:
		queue_free()

