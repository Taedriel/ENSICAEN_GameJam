extends Node

signal next_second(newTime)

var sens = true
export (int) var maxTime = 300
var time = maxTime
var timeArray


func _ready():
	#connect all the node to the signal we will send
	for node in get_tree().get_nodes_in_group("player")[0].get_children():
		if node is Control:
			self.connect("next_second", node, "_on_next_second")
		if node is KinematicBody:
			self.connect("next_second", node, "_on_next_second")
	
	timeArray = []
	for i in range(time):
		timeArray.append([])
	
func _process(delta):
	time -= (1 if sens else -1) * delta
	emit_signal("next_second", int(time))
	
	if (time <= 0 or time > maxTime):
		game_over()
	
	
	if !sens:
		recover_actions()

func game_over():
	get_tree().change_scene("res://godot_component/scene/GameOver.tscn")

func recover_actions():
	
	for action in timeArray[time]:
		print("il s'est passé tout ça !")
		print(action)
	
	
# function that wil be call when node send signals
func reverseTime(val):
	if val:
		print("Time reverse !")
		sens = false
	else :
		print("Time normal !")
		sens = true
		
func addEvent(recap):
	print("recap obtenu !")
	for action in recap:
		timeArray[time].append(action)
