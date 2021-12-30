# bullet.gd
extends KinematicBody2D

var speed 
var distance
var distanceTravelled = 0
var _Particles = preload("res://ExplosionParticles.tscn")
var isStopped = false
signal impacted

func _ready():
	$Bullet.visible = true
	$Crater.visible = false

func fire(speed: float, distance: float):
	self.speed = speed
	self.distance = distance
	visible = true

func Explode():
	var rdg = RandomNumberGenerator.new()
	rdg.randomize()
	var particles_instance = _Particles.instance()
	particles_instance.global_position = global_position
	particles_instance.get_node("Dirt").global_rotation_degrees = global_rotation_degrees + 90
	particles_instance.get_node("Dirt").emitting = true
	particles_instance.get_node("Dust").emitting = true
	particles_instance.get_node("Sparks").emitting = true
	get_tree().get_root().add_child(particles_instance)
	emit_signal("impacted")
	$Bullet.visible = false
	$Crater.rotation_degrees = rdg.randi_range(1, 360)
	$Crater.visible = true


func _physics_process(delta):
	if visible:
		var collider = move_and_collide(get_global_transform().basis_xform(Vector2.RIGHT * speed))
		distanceTravelled += speed
		if distance - distanceTravelled < speed:
			speed = distance - distanceTravelled
		if distanceTravelled >= distance:
			speed = 0
			if isStopped == false:
				Explode()
				isStopped = true
