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
	card_hover = card

func _get_drag_data(pos):
	var preview = cardPreview.instantiate()
	set_drag_preview(preview)
	card_draged = card_hover
	return card_draged

func _can_drop_data(pos, card_draged):
	var allow = true if card_hover != null else false
	return allow

func _drop_data(pos, card_draged):
	
	if card_draged == null:
		return
	
	if card_hover == null:
		return

	if card_hover == card_draged:
		return
#	
	var closest_child
	var last_distance : float = -1
	var is_before := true

	var scrolled_mouse_pos := Vector2(pos.x, pos.y + card_container_scroll.get_v_scroll())

	for child in card_container.get_children():
		var distance : float = child.get_position().distance_to(scrolled_mouse_pos)

		if last_distance == -1 or (distance < last_distance):
			last_distance = distance
			closest_child = child
	
	var index = -1
	for child in card_container.get_children():
		index += 1
		if child == card_hover:
			break
	
	if index != -1:	
		card_container.move_child(card_draged, index)

