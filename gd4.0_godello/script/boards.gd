extends ColorRect

@onready var personal_boards_container := $ScrollContainer/MarginContainer/BoxContainer/PersonalBoardsContainer

func _on_CreateBoard_pressed():
	DataRepository.create_board()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
