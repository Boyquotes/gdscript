extends Window


func _on_Button_pressed():
	emit_signal("close_requested")
	#queue_free()
