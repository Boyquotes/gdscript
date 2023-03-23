# https://github.com/alfredbaudisch/Godello
	# 原版在这里，是 godot 3.5 的
extends ColorRect

@onready var content_container := $ContentContainer
@onready var main_scene = $"."

var boards
var overlay

# Called when the node enters the scene tree for the first time.
func _ready():
	#DisplayServer.window_set_size(Vector2i(1024, 600))
	#boards = load("res://scenes/boards.tscn").instantiate()
	#boards = load("res://scenes/brds.tscn").instantiate()
	boards = load("res://scenes/bds.tscn").instantiate()
	content_container.add_child(boards)
	#SceneUtils.create_single_error_popup("test pop window......", self, self)
	#await DataRepository.board_created
	
	DataRepository.board_creating.connect(on_overlay)
	#get_tree().root.connect(DataRepository.board_created, on_overlay)
	
	print("main_scene _ready() end")

func on_overlay():
	main_scene.color = Color(55, 55, 55, 0.5)

func on_deoverlay():
	main_scene.color = Color(255, 255, 255, 255)

func _process(_delta):
	pass
