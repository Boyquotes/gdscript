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
	if card_hover == null:
		# 从别的 list 拖过来的 card，再对它进行拖动会发生这种情况
		var closest_child = null
		var last_distance : float = -1
		var is_before := true

		var scrolled_mouse_pos := Vector2(pos.x, pos.y + card_container_scroll.get_v_scroll())

		for child in card_container.get_children():
			var distance : float = child.get_position().distance_to(scrolled_mouse_pos)

			if last_distance == -1 or (distance < last_distance):
				last_distance = distance
				closest_child = child
		if closest_child == null:
			return
		card_hover = closest_child
		
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
	
	
	var is_other_list = true  # 是否是从其他 list 拖过来的 
	for child in card_container.get_children():
		if child == card_draged:
			is_other_list = false
			break
	
	if not is_other_list:
		var index = -1
		for child in card_container.get_children():
			index += 1
			if child == card_hover:
				break
		if index != -1:
			card_container.move_child(card_draged, index)
	else:
		# 是从其它 list 拖过来的
		var lists = self.get_parent()
		var other_card_container = null
		var ListContainer = lists.get_node("%ListContainer")
		for list in ListContainer.get_children():
			if list == self:
				continue
			var CardContainer = list.get_node("%CardContainer")
			for card in CardContainer.get_children():
				if card == card_draged:
					other_card_container = CardContainer
					break
			if other_card_container != null:
				break
		
		if other_card_container == null:
			print("unknow err.")
		
		other_card_container.remove_child(card_draged)
		
		var index = -1
		for child in card_container.get_children():
			index += 1
			if child == card_hover:
				break
		if index != -1:
			card_container.add_child(card_draged)
			card_container.move_child(card_draged, index)
