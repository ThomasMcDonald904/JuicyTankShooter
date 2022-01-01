extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

class_name Health

export var health = 100
export var immortal = false

signal damage_received(ammount)
signal died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func damage(ammount):
	emit_signal("damage_received", ammount)
	health -= ammount
	if !immortal && health <= 0:
		emit_signal("died")

func on_impact(body: Node):
	var damageNode = body.get_node_or_null("Damage")
	if damageNode != null && damageNode.has_method("get_impact_damage"):
		damage(damageNode.get_impact_damage())
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
