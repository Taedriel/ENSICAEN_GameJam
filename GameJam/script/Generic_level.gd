extends Node

signal next_second(newTime)

var sens = true
export (int) var time = 300


func _ready():
	#connect all the node to the signal we will send
	for node in get_tree().get_nodes_in_group("player")[0].get_children():
		if node is Control:
			self.connect("next_second", node, "_on_next_second")
	
func _process(delta):
	time -= (1 if sens else -1) * delta
	emit_signal("next_second", int(time))
	
	
# function that wil be call when node send signals
func reverseTime(val):
	if val:
		print("Time reverse !")
		sens = false
	else :
		print("Time normal !")
		sens = true
