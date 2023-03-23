extends ConfirmationDialog

@onready var line := $LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_ok():
	if line.text == "":
		return
	DataRepository.create_board_card_done()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
