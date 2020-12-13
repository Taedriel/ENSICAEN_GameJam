extends Node2D


func fade_out(action, cible):
	set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.3))
	yield(get_tree().create_timer(0.5), "timeout")
	if action == "change_scene":
		get_tree().change_scene(cible)
