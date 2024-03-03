extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	$"../OSCClient - To sclang defined port".send_message("/foo", ["hello", "world", 62])
	pass # Replace with function body.
