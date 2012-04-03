package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;
import firmament.core.FGame;
import firmament.core.FPhysicsCollisionEvent;

/**
 * ...
 * @author Gunnar Wambaugh
 */

class BaseForceField extends FPhysicsEntity
{
	var resistance:Int;
	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		this.addEventListener(FGame.COLLISION_EVENT, function(e:FPhysicsCollisionEvent) {
				
				if (this.resistance <= 0) {
				fieldDestroy();
				};
			});
		config.collisionCategory = 4;
		config.collidesWith = 1;
		super(world, config);
	}
	public function getResistance():Int {
		return resistance;
	}
	public function fieldDestroy() {
		
	}
	
}