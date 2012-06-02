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
	var dead:Bool;
	public function new(world:FPhysicsWorld, config:Dynamic) 
	{
		dead = false;
		super(world, config);
		this.addEventListener(FGame.COLLISION_EVENT, function(e:FPhysicsCollisionEvent) {
			//trace('collision detected!');
			var speed = e.getCollisionSpeed();
			var entA = e.getEntityA();
			var entB = e.getEntityB();
			if (entA.getConfig().objType == "Shrapnel") {
				return; 
			}
			if (entB.getConfig().objType == "Shrapnel") {
				return; 
			}
			if (speed < 0) {
				speed =speed * -1;
			}
			 if (speed < .05) {
				return;
			}
			var damage = speed * 10 ;
			health = health - damage;
			//trace (health);
			takeDamage();
			if (this.health <= 0) {
				this.delete();
				trace('deleted');
				this.dead = true;
			}
			
		});
		
	}
	public function getHealth():Float{
		return health;
	}
	public function takeDamage() {}
}