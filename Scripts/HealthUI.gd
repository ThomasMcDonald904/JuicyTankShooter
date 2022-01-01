extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var healthBar: TextureProgress = get_node("HealthBar")
onready var healthNode: Health = get_node("../Node2D/Health")

# Called when the node enters the scene tree for the first time.
func _ready():
	healthBar.max_value = healthNode.health
	healthBar.value = healthNode.health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Health_damage_received(ammount):
	healthBar.value = healthNode.health
	pass # Replace with function body.
