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
#	print(int(time * 100))
	
	if oldTime - (1 * s) == int(time):
		emit_signal("next_second", int(time))
		oldTime = int(time)
	
	if (int(time*100) <= 0 or int(time*100) > (maxTime*100)):
		game_over()
	else:
		if !sens:
			recover_actions()

func game_over():
	print("gameOver")
	get_tree().change_scene("res://godot_component/scene/GameOver.tscn")

func recover_actions():
	var objArray = []
	time -= 0.01
	for elem in timeArray[int(time * 100)]:
		match (elem[1]["action"]):
			"right":
				elem[0].position = elem[1]["pos"]
				elem[0].move_right()
			
			"left":
				elem[0].position = elem[1]["pos"]
				elem[0].move_left()
			
			"idle":
				pass
				
			"fire":
				pass
				
			"swap":
				var newplayer = load("res://godot_component/dynamic_obj/DinoDoux.tscn").instance()
				add_child(newplayer)
				for node in newplayer.get_children():
					if node is Camera2D:
						node.current = true
		
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
#		print(obj.name, ": ", recap["action"])
		timeArray[int(time*100)].append([obj, recap])
