extends Area2D

export var speed = 1000

var vel = Vector2()

func _ready():
	set_fixed_process(true)

func start_at(direction, position):
	set_rotation(direction)
	set_position(position)
	vel = Vector2(speed, 0).rotated(direction)

func _fixed_process(delta):
	set_position(get_position() + vel * delta)

func _on_Lifetime_timeout():
	queue_free()
