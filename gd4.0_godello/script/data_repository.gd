extends Node

signal board_creating()
signal board_created()

func create_board():
	#add_board(board)
	emit_signal("board_creating")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
