extends ColorRect

@onready var personal_boards_container := $MarginContainer/BoxContainer/PersonalBoardsContainer
@onready var create_Button := $MarginContainer/BoxContainer/PersonalBoardsContainer/Button
func _on_CreateBoard_pressed():
	DataRepository.create_board()

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1):
		var btn_clone = create_Button.duplicate()
		btn_clone.set_text(str(i))
		personal_boards_container.add_child(btn_clone)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
