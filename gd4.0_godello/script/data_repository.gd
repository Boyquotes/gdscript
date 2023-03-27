extends Node

signal board_creating()
signal board_created()
signal board_card_name_get(name_card:String)
	# 用户完成了卡片名字的输入

signal switchScene(sender, scene) # 场景切换

func create_board_card():
	#add_board(board)
	emit_signal("board_creating")

func create_board_card_done():
	emit_signal("board_created")

func card_name_get(name_card:String):
	emit_signal("board_card_name_get", name_card)
	
func switch_Scene(sender, scene):
	emit_signal("switchScene", sender, scene)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
