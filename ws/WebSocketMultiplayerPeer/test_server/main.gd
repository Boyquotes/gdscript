extends Node2D

var peer: WebSocketMultiplayerPeer = WebSocketMultiplayerPeer.new()
var tlsOptions: TLSOptions

func _ready():
	generate_self_signed_certificate()
	tlsOptions = TLSOptions.server(load("res://privkey.key"), load("res://fullchain.crt"))
	create_websocket_server()
	
func create_websocket_server():
	multiplayer.peer_connected.connect(
		func _hi(p):
			print("HI ", p)
	)
	
	#var error = peer.create_server(1235, "*", tlsOptions)
	var error = peer.create_server(1235, "*")
	print("err: ", error)
	multiplayer.multiplayer_peer = peer

func generate_self_signed_certificate():
	var key = Crypto.new().generate_rsa(2048)
	var cert = Crypto.new().generate_self_signed_certificate(key, "CN=127.0.0.1,O=local,C=KR")
	
	#key.save("privkey.key")
	#cert.save("fullchain.crt")
