extends Node2D

signal next_second(newTime)
signal time_change(val)

const UP = Vector2(0, -1)

var sens = true
export (int) var maxTime = 300
var time = int(0.75 * maxTime)
var oldTime = maxTime
var timeArray

var ressources

func fade_out(action, cible):
	set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.3))
	yield(get_tree().create_timer(0.5), "timeout")
	if action == "change_scene":
		get_tree().change_scene(cible)


func _ready():
	#connect all the node to the signal we will send
	add_to_group("levelManager")
	for node in get_tree().get_nodes_in_group("player")[0].get_children():
		if node is Control:
			self.connect("next_second", node, "_on_next_second")
		
	for node in get_tree().get_root().get_child(0).get_children(): 
		if node.has_method("_on_time_change"):
			self.connect("next_second", node, "_on_next_second")
			self.connect("time_change", node, "_on_time_change")
	
	for node in get_tree().get_nodes_in_group("box"):
		self.connect("time_change", node, "_on_time_change")
		


func _init():	
	ressources = {}
	timeArray = []
	# one case per frame per maxTime seconde
	for i in range(maxTime * 100 + 1):
		timeArray.append([])
	
	time = int(0.75 * time)
	oldTime = time - 1
	
	print("INIT: ", time)
	
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
	for elem in timeArray[int(time * 100)]:
		if elem[0] != null:
			elem[0].position = elem[1]["pos"]

			match (elem[1]["action"]):
				"right":
					elem[0].move_right()
				"left":
					elem[0].move_left()
				"down":
					elem[0].move_down()
				"up":
					elem[0].move_up()
				"idle":
					elem[0].idle()
		
# function that wil be call when node send signals
func reverseTime(val):
	if val:
		print("=============================Time reverse !")
		sens = !sens
		time += 0.01
		emit_signal("time_change", sens)
	else :
		print("==============================Time normal !")
		sens = !sens
		time -= 0.01
		emit_signal("time_change", sens)
		
func addEvent(recap, obj):
#	print(int(time))
	if len(recap) != 0:
#		print(obj.name, ": ", recap["action"])
		timeArray[int(time*100)].append([obj, recap])


func addRessources(name, res):
	ressources[name] = res
