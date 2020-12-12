extends Node

signal next_second(newTime)
signal sens_time(val)

const UP = Vector2(0, -1)

var sens = true
export (int) var maxTime = 300
var time = maxTime
var oldTime = maxTime
var timeArray



func _ready():
	#connect all the node to the signal we will send
	for node in get_tree().get_nodes_in_group("player")[0].get_children():
		if node is Control:
			self.connect("next_second", node, "_on_next_second")
		
	for node in get_tree().get_root().get_child(0).get_children():
		if node is KinematicBody2D:
			self.connect("next_second", node, "_on_next_second")
			self.connect("sens_time", node, "_on_time_sens_changing")
	
	timeArray = []
	# one case per frame per maxTime seconde
	for i in range(maxTime * 100 + 1):
		timeArray.append([])
	
func _process(delta):
	var s = (1 if sens else -1)
	time -= s * delta
	
	if oldTime - (1 * s) == int(time):
		emit_signal("next_second", int(time))
		oldTime = int(time)
	
	if (time <= 0 or time > maxTime):
		game_over()
	
	if !sens:
		recover_actions()

func game_over():
	print("gameOver")
	get_tree().change_scene("res://godot_component/scene/GameOver.tscn")

func recover_actions():
	var objArray = []
	
	for elem in timeArray[int(time * 100)]:
		if elem[1]["action"] == "move":
			elem[0].position = elem[1]["pos"]
			
		elif elem[1]["action"] == "idle":
			pass
				
		elif elem[1]["action"] == "fire":
			pass
		
# function that wil be call when node send signals
func reverseTime(val):
	if val:
		print("Time reverse !")
		sens = false
	else :
		print("Time normal !")
		sens = true
		
func addEvent(recap, obj):
#	print(int(time))
	if len(recap) != 0:
#		print(obj.name, ": ")
		timeArray[int(time*100)].append([obj, recap])
