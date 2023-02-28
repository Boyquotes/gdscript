extends ColorRect
@onready var content_container := $ContentContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	#DisplayServer.window_set_size(Vector2i(1024, 600))
	SceneUtils.create_single_error_popup("test pop window.", self, self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
