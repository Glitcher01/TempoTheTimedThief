extends CharacterBody2D


# Upon the player colliding with the key, increase the player's
# in-level key count accordingly, then remove the key.
func _on_pick_up_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameManager.temp_keys += 1
		AudioManager.play_key_pickup()
		queue_free()
