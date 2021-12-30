extends KinematicBody2D

export(float) var speed  # speed in pixels/sec
export(float) var BulletTravelSpeed
var rotation_speed = 2
var velocity = Vector2.ZERO
var bullet = preload("res://Bullet.tscn")
const BULLET_SPEED = 1000
var ExplosionParticles = preload("res://ExplosionParticles.tscn")

func _ready():
	# Sets tank base distance
	$Node2D/TankHead/Sprite/CrosshairPosition.position = Vector2(0, -162.634)
	$Node2D/TankHead/Muzzle.position = Vector2(0, -18.286)
	$Node2D/TankHead/Muzzle.transform
	$Node2D/TankHead.set_frame(0)

func get_input(delta):
	var rot_dir = 0
	if Input.is_action_pressed("ui_right"):
		rot_dir += 1
	if Input.is_action_pressed("ui_left"):
		rot_dir -= 1
	rotation += rotation_speed * rot_dir * delta
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-speed/2, 0).rotated(rotation)

func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity)
	$Node2D.look_at(get_global_mouse_position())
	
func _process(delta):
	update_crosshair_position()
	shoot()

func update_crosshair_position():
	if Input.is_action_just_pressed("CannonRaise"):
		if $Node2D/TankHead.frame < 10:
			$Node2D/TankHead/Sprite.position += Vector2(0, 10)
			$Node2D/TankHead.frame += 1

	if Input.is_action_just_pressed("CannonLower"):
		if $Node2D/TankHead.frame > 0:
			$Node2D/TankHead/Sprite.position += Vector2(0, -10)
			$Node2D/TankHead.frame -= 1

func OnImpact():
	$Camera2D.shake_amount = 12
	for i in 3:
		$Camera2D.shake_amount -= 4
		yield(get_tree().create_timer(0.1), "timeout")

func shoot():
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = bullet.instance()
		bullet_instance.connect("impacted", self, "OnImpact")
		bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
		bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
		get_tree().get_root().add_child(bullet_instance)
		match $Node2D/TankHead.frame:
			0:
				bullet_instance.fire(20, 153)
			1:
				bullet_instance.fire(20, 142)
			2:
				bullet_instance.fire(20, 133)
			3:
				bullet_instance.fire(20, 122)
			4:
				bullet_instance.fire(20, 111)
			5:
				bullet_instance.fire(20, 101)
			6:
				bullet_instance.fire(20, 90)
			7:
				bullet_instance.fire(20, 79)
			8:
				bullet_instance.fire(20, 69)
			9:
				bullet_instance.fire(20, 58)
			10:
				bullet_instance.fire(20, 48)































#			0:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -10).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			1:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -9.25).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			2:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -8.6).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			3:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -7.8).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			4:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -7.2).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			5:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -6.5).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			6:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -5.8).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			7:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -5.1).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			8:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -4.4).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			9:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -3.7).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()
#			10:
#				bullet_instance.global_position = $Node2D/TankHead/Muzzle.global_position
#				bullet_instance.look_at($Node2D/TankHead/Sprite/CrosshairPosition.global_position)
#				bullet_instance.rotate(1.5708)
#				get_tree().get_root().add_child(bullet_instance)
#				for i in 15:
#					bullet_instance.position += Vector2(0, -2.9).rotated(bullet_instance.rotation)
#					yield(get_tree().create_timer(BulletTravelSpeed),"timeout")
#				var particles_instance = ExplosionParticles.instance()
#				particles_instance.set_position(bullet_instance.get_position())
#				particles_instance.set_emitting(true)
#				add_child(particles_instance)
#				if particles_instance.emitting == false:
#					particles_instance.queue_free()
#				yield(get_tree().create_timer(4),"timeout")
#				bullet_instance.queue_free()




# # Classic Shoot Method
#	var bullet_instance = bullet.instance()
#	bullet_instance.global_position = $Node2D/Sprite/Muzzle.global_position + Vector2(0, -10)
#	bullet_instance.look_at(get_global_mouse_position())
#	bullet_instance.get_node(".").apply_central_impulse(Vector2(cos(bullet_instance.rotation), sin(bullet_instance.rotation)) * BULLET_SPEED)
#	get_tree().get_root().add_child(bullet_instance)
