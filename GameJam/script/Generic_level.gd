extends Node

signal reverse_time(val)

func _ready():
	connect("reverse_time", self, "reverseTime")
	


func reverseTime():
	pass
