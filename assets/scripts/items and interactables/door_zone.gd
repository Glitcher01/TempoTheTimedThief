extends Area2D

@onready var timer: Timer = $Timers/mov

var player: Node2D
var is_transitioning: bool = false

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func _process(_delta: float) -> void:
	if is_transitioning:
		return

	if Input.is_action_just_pressed("interact"):
		for body in get_overlapping_bodies():
			if body.name == "Player":
				start_transition(body)
				break

func start_transition(body: Node2D) -> void:
	is_transitioning = true
	player = body
	player.can_move = false
	player.is_transitioning = true
	
	TransitionScene.transition()
	await TransitionScene.on_transition_finished
	
	player.is_transitioning = false
	body.global_position = $Marker2D.global_position
	timer.start(1.0)

func _on_timer_timeout() -> void:
	player.can_move = true
	is_transitioning = false
