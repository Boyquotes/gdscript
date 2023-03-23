extends Node

signal board_creating()
signal board_created()

func create_board_card():
	#add_board(board)
	emit_signal("board_creating")

func create_board_card_done():
	emit_signal("board_created")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
