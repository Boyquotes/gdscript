extends ColorRect

@onready var content_container := $ContentContainer

var boards

# Called when the node enters the scene tree for the first time.
func _ready():
	#DisplayServer.window_set_size(Vector2i(1024, 600))
	#boards = load("res://scenes/boards.tscn").instantiate()
	boards = load("res://scenes/bds.tscn").instantiate()
	content_container.add_child(boards)
	#SceneUtils.create_single_error_popup("test pop window......", self, self)
	#await DataRepository.board_created
	print("main_scene _ready() end")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
