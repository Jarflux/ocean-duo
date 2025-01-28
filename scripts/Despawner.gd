extends Area2D

func _ready():
	self.monitoring = true
	self.body_entered.connect(self.onHitDespawner);

func onHitDespawner(other):
	other.queue_free()
