extends Control

@onready
var video_player : VideoStreamPlayer = $VideoStreamPlayer

@export
var stream_paths : Array[String]
var streams : Array[VideoStream]
var current_stream_index : int

func _ready():
	for path in stream_paths:
		streams.append(load(path))
	
	video_player.stream = streams[current_stream_index]
	video_player.play()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
			current_stream_index += 1
			if current_stream_index >= streams.size():
				current_stream_index = 0
				
			video_player.stream = streams[current_stream_index]
			video_player.play()
