package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;
import firmament.core.FGame;
import firmament.core.FPhysicsCollisionEvent;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class DestroyableEntity extends FPhysicsEntity 
{
	var health:Float;
	public function new(world:FPhysicsWorld, config:Dynamic) 
	{
		this.addEventListener(FGame.COLLISION_EVENT, function(e:FPhysicsCollisionEvent) {
			var speed = e.getCollisionSpeed();
			 if (speed == 0) {
				return;
			}
			if (speed < 0) {
				speed =speed * -1;
			}
			var damage = speed * 10 ;
			health = health - damage;
			trace (health);
			if (this.health <= 0) {
				this.delete();
				trace('deleted');
			}
		});
		super(world, config);
	}
	public function getHealth():Float{
		return health;
	}
}