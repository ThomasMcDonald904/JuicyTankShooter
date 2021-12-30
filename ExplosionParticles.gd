extends Node2D

func _process(delta):
	particles()

func particles():
	if Input.is_action_just_pressed("shoot"):
		$Sparks.emitting = true
		$Dirt.emitting = true

