extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pressed():
	# Send an OSC message to sclang
	
	$"../OSCClient - To sclang".send_message("/helloWorld", [1, "72", 0.125])
	
	pass # Replace with function body.
