extends PanelContainer

@onready var card_container_scroll := $MarginContainer/VerticalContent/CardContainerScroll
@onready var card_container := $MarginContainer/VerticalContent/CardContainerScroll/CardContainer
const CardScene := preload("res://scenes/card.tscn")
const cardPreview := preload("res://scenes/card_mouse_preview.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		var card_element = CardScene.instantiate()
		card_container.add_child(card_element)
		card_element.setTitle(str(i))

func _get_drag_data(pos):
	var preview = cardPreview.instantiate()
	set_drag_preview(preview)
	
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
	print("closest_child: " + title)
	
	#return { "cardID":"001" }
#	print(closest_child.)
	return closest_child

func _can_drop_data(pos, card_draged):
	return true

func _drop_data(pos, card_draged):
	var closest_child
	var last_distance : float = -1
	var is_before := true

	var scrolled_mouse_pos := Vector2(pos.x, pos.y + card_container_scroll.get_v_scroll())

	for child in card_container.get_children():
		var distance : float = child.get_position().distance_to(scrolled_mouse_pos)

		if last_distance == -1 or (distance < last_distance):
			last_distance = distance
			closest_child = child
	

func find_closest_vertical_child(mouse_pos, compare_to, container, container_scroll) -> Array:
	var closest_child
	var last_distance : float = -1
	var is_before := true

	var scrolled_mouse_pos := Vector2(mouse_pos.x, mouse_pos.y + container_scroll.get_v_scroll())

	for child in container.get_children():
		var distance : float = child.get_position().distance_to(scrolled_mouse_pos)

		if last_distance == -1 or (distance < last_distance):
			last_distance = distance
			closest_child = child

	if closest_child and closest_child != compare_to:
		var y = closest_child.get_position().y
		var height = closest_child.get_size().y
		is_before = scrolled_mouse_pos.y <= (y + height * 0.5)
		return [closest_child, is_before]

	return [false]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
