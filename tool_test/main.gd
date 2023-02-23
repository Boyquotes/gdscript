tool
extends Control
#extends EditorScript # just 4 test, make this script can run
func _run():
	_ready()
	



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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
