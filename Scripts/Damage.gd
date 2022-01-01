extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var impact_damage = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_impact_damage()->float:
	return impact_damage

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
