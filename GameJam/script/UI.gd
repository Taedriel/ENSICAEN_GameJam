extends Control
	
func _on_next_second(newSec):
	get_tree().get_nodes_in_group("chrono")[0].text = str(newSec)
