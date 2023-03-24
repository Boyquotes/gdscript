extends ConfirmationDialog

@onready var line := $LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_hide_on_ok(false) # 按下OK 不自动隐藏
	line.grab_focus()
	pass # Replace with function body.

func on_ok():
	if line.text == "":
		return
	self.set_visible(false)
	DataRepository.card_name_get(line.text)

func on_cancel():
	DataRepository.card_name_get("")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
