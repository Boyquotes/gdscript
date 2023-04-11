extends PanelContainer

@onready var card_container := $MarginContainer/VerticalContent/CardContainerScroll/CardContainer
const CardScene := preload("res://scenes/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		var card_element = CardScene.instantiate()
		card_container.add_child(card_element)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
