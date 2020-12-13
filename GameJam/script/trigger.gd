extends "Event.gd"

signal trigger(status)


# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.connect("body_entered", self, "_on_body_entered")
	self.connect("body_exited", self, "_on_body_exited")

	for child in get_parent().get_children():
			if child == self:
				continue
			else:
				if child.has_method("_on_trigger"):
					self.connect("trigger", child, "_on_trigger")
					

func _on_body_entered(body):
	emit_signal("trigger", true)

func _on_body_exited(body):
	emit_signal("trigger", false)
