extends MarginContainer

@onready var title_label := $CardContent/InnerPadding/VBoxContainer/TitleContainer/Title

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setTitle(title):
	title_label.set_text(title)

func getTitle():
	return title_label.get_text()



