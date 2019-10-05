extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var interface = ARVRServer.find_interface("OpenVR")
	if interface and interface.initialize():
		get_viewport().arvr = true
		get_viewport().keep_3d_linear = true
	else:
		print("initing VR failed :(")