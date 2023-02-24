extends HSplitContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	#if OS.get_name()=="HTML5":
	#self.set_size( OS.get_window_size() )
	get_tree().root.connect("size_changed", self, "on_size_changed")
	OS.set_window_maximized(true)

func on_size_changed():
	self.set_size( OS.get_window_size() )

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
