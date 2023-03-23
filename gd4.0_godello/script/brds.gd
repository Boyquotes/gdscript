extends ColorRect
@onready var personal_boards_container := $ScrollContainer/VBoxContainer/PersonalBoardsContainer
@onready var create_Button = $ScrollContainer/VBoxContainer/PersonalBoardsContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(30):
		var btn_clone = create_Button.duplicate()
		btn_clone.set_text(str(i))
		personal_boards_container.add_child(btn_clone)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
