tool
extends Control
#extends EditorScript # just 4 test, make this script can run
func _run():
	_ready()
	
var screen_size : Vector2 = Vector2()

func _on_root_resize():
	rect_size =  get_tree().root.size  # get_node("/root")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Engine.editor_hint:
		print('code exec in editor!')
	else:
		print('code exec in real scene.')
	pass # Replace with function body.
	rect_size =  get_tree().root.size  # get_node("/root")
	print(rect_size)
	get_tree().root.connect("size_changed", self, "on_size_changed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if rect_size != get_tree().root.size:
		rect_size = get_tree().root.size
	
func on_size_changed():
	print("Resizing: ", get_viewport_rect().size, OS.get_window_size())
	self.set_size( OS.get_window_size() )

"""


func _ready():
screen_size = OS.get_screen_size()# Gets the screen size to test in futur if its change since their

func _process(delta) -> void:
	if OS.get_screen_size() != screen_size: #Tests if your screen changed in size, e.g a different monitor
		screen_size = OS.get_screen_size()
		OS.set_window_size(screen_size)# Sets your window to your screen size
"""
