extends PanelContainer

@onready var card_container := $MarginContainer/VerticalContent/CardContainerScroll/CardContainer
const CardScene := preload("res://scenes/card.tscn")
const cardPreview := preload("res://scenes/card_mouse_preview.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		var card_element = CardScene.instantiate()
		card_container.add_child(card_element)
	
func _get_drag_data(_pos):
	var preview = cardPreview.instantiate()
	set_drag_preview(preview)
	return { "cardID":"001" }

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
