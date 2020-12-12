extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var children = get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if Input.is_action_pressed('ui_up'):
		for p in get_tree().get_nodes_in_group("player"):
			p.position.x += 10
			p.position.y += 10 
	

