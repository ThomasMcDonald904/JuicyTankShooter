#Enemy.gd
extends Sprite

var angle_cone_of_vision = deg2rad(180)
var angle_between_rays = deg2rad(10)
var max_view_distance = 800
var raySights = []
var results = []
var canSeePlayer = false
var speed = 20
var player: Node2D

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("click"):
		for ray in $RaycastContainer.get_children():
			if ray.is_colliding():
				print(ray.get_collider())

func _process(delta):
	if canSeePlayer:
		look_at(player.global_position)
		position += Vector2.RIGHT.rotated(rotation) * speed * delta
		look_at(player.global_position)
		canSeePlayer = abs(Vector2.RIGHT.rotated(rotation).angle_to(player.global_position - global_position)) <= deg2rad(50)

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		player = body
		if abs(Vector2.RIGHT.rotated(rotation).angle_to(body.global_position - global_position)) <= deg2rad(50):
			canSeePlayer = true





#func generate_raycasts():
#	var ray_count := angle_cone_of_vision / angle_between_rays
#
#	for index in ray_count:
#		var ray := RayCast2D.new()
#		var angle = angle_between_rays * (index - ray_count / 2.0)
#		ray.cast_to = Vector2.UP.rotated(angle) * max_view_distance
#		add_child(ray)
#		ray.enabled = true

#	for ray in get_children():
#		if ray.is_colliding() and ray.get_collider().name == "Player":
#			does_see_player = true
#		else:
#			does_see_player = false

