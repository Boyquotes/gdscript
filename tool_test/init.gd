tool
extends EditorScript

func _run():
	if Engine.editor_hint:
		print('code exec in editor!')
	else:
		print('code exec in real scene.')

	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
