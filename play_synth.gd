extends Button

##Arguments to send to the created synth on scsynth (supercollider's server). 
@export var args := ["freq", 440, "attack", 2, "decay", 2]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	# Send an osc message directly to supercollider to create a new synth on the server
	$"../OSCClient - To scsynth".send_message("/s_new", ["sine", -1, 0, 0] + args)
	pass # Replace with function body.
