extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var time = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	get_tree().get_nodes_in_group("chrono")[0].text = str(int(time))
	


