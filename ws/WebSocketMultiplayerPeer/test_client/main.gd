extends Node2D

var peer = WebSocketMultiplayerPeer.new()

func _ready():
	#var tlsOptions = TLSOptions.client(load("res://fullchain.crt"))
	#var err = peer.create_client("wss://127.0.0.1:1235", tlsOptions)
	var err = peer.create_client("wss://127.0.0.1:1235")
	print("err: ", err)
	multiplayer.multiplayer_peer = peer
