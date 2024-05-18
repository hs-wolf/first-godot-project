extends Node2D

@onready var ray_cast_2d_right = $RayCast2DRight
@onready var ray_cast_2d_left = $RayCast2DLeft
@onready var ray_cast_2d_ground_right = $RayCast2DGroundRight
@onready var ray_cast_2d_ground_left = $RayCast2DGroundLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

const speed = 20
var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_2d_right.is_colliding() || !ray_cast_2d_ground_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_2d_left.is_colliding() || !ray_cast_2d_ground_left.is_colliding():
		animated_sprite_2d.flip_h = false
		direction = 1
	position.x += direction * speed * delta
