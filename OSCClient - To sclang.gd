extends OSCClient


# Called when the node enters the scene tree for the first time.
func _ready():
	$"../OSCServer".incoming_messages["/langPort"] = [577777]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Set the language port
	if $"../OSCServer".incoming_messages["/langPort"][0] != port:
		port = $"../OSCServer".incoming_messages["/langPort"][0]
		connect_socket(ip_address, port)
		print(port)
	
	pass



