package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;
import firmament.core.FGame;
import firmament.core.FPhysicsCollisionEvent;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class BaseWall extends FPhysicsEntity 
{
	var strength:Int; 
	public function new(world:FPhysicsWorld, config:Dynamic)
	{
		this.addEventListener(FGame.COLLISION_EVENT, function(e:FPhysicsCollisionEvent) {
				
				if (this.strength <= 0) {
				wallDestroy();
				};
			});
		super (world, config);
	}
	public function getStrength():Int {
		return strength;
	}
	public function wallDestroy() {
		
	}
	
	
}