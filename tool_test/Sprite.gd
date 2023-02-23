# https://docs.godotengine.org/zh_CN/stable/getting_started/step_by_step/scripting_first_script.html
extends Sprite
var speed = 400		   # 像素每秒
var angular_speed = PI # 弧度每秒

func _init():
	print("Hello, world!")
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += angular_speed * delta # 一帧都增加一个旋转量 rotation 是从 Node2D 继承来的
