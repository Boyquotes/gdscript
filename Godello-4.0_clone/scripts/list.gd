extends PanelContainer

@onready var card_container_scroll := $MarginContainer/VerticalContent/CardContainerScroll
@onready var card_container := $MarginContainer/VerticalContent/CardContainerScroll/CardContainer
const CardScene := preload("res://scenes/card.tscn")
const cardPreview := preload("res://scenes/card_mouse_preview.tscn")

var card_hover = null
var card_draged = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		var card_element = CardScene.instantiate()
		card_container.add_child(card_element)
		card_element.setTitle(str(i))
		
		card_element.card_hover_changed.connect(on_card_hover_changed)
		
func on_card_hover_changed(card):
	pass

func _get_drag_data(pos):
	return null

func _can_drop_data(pos, card_draged):
	return null

func _drop_data(pos, card_draged):
	pass
