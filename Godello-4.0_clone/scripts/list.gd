extends PanelContainer

@onready var card_container_scroll := $MarginContainer/VerticalContent/CardContainerScroll
@onready var card_container := $MarginContainer/VerticalContent/CardContainerScroll/CardContainer
const CardScene := preload("res://scenes/card.tscn")
#const CardDragPreview := preload("res://scenes/card_mouse_preview.tscn")

var card_hover = null
var card_draged = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		var card_element = CardScene.instantiate()
		card_container.add_child(card_element)
		card_element.setTitle(str(i))

func _can_drop_data(pos, _card_draged):
	
	var closest_child
	var last_distance : float = -1
	var is_before := true

	var scrolled_mouse_pos := Vector2(pos.x, pos.y + card_container_scroll.get_v_scroll())

	for child in card_container.get_children():
		var distance : float = child.get_position().distance_to(scrolled_mouse_pos)

		if last_distance == -1 or (distance < last_distance):
			last_distance = distance
			closest_child = child

	var title = closest_child.getTitle()
	print("card_draged: " + _card_draged.getTitle())
	print("closest_child: " + title)
	if _card_draged.get_parent() == card_container:
		card_container.move_child(_card_draged, closest_child.get_index())
	else:
		print("### card_draged from another list")
	return true

func _drop_data(_pos, _card_draged):
	print("### list droped")
	_card_draged.set_drag_looking(false)


