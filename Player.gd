extends Area2D

signal explode
signal shoot
signal pickup
signal shield_changed

export var rot_speed = 2.6
export var thrust = 500
export var max_vel = 400
export var friction = 0.65
export (PackedScene) var bullet

var screen_size = Vector2()
var rot = 0
var pos = Vector2()
var vel = Vector2()
var acc = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	pos = screen_size / 2
	set_position(pos)
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("player1shoot"):
		shoot()
	if Input.is_action_pressed("player1right"):
		rot += rot_speed * delta
	if Input.is_action_pressed("player1left"):
		rot -= rot_speed * delta
	if Input.is_action_pressed("player1thrust"):
		acc = Vector2(thrust, 0).rotated(rot)
	else:
		acc = Vector2(0, 0)
	
	acc += vel * -friction
	vel += acc * delta
	pos += vel * delta
	
#	if position.x > global.screen_size.x:
#		position.x = 0
#	if position.x < 0:
#		position.x = global.screen_size.x
#	if position.y > global.screen_size.y:
#		position.y = 0
#	if position.y < 0:
#		position.y = global.screen_size.y
	set_position(pos)
	
	set_rotation(rot + PI/2)

func shoot():
#	$GunTimer.start()
#	$LaserSound.play()
	emit_signal("shoot", bullet, $Muzzle.global_position, rotation)