package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;
import firmament.core.FGame;
import firmament.core.FPhysicsCollisionEvent;

/**
 * ...
 * @author Gunnar Wambaugh
 */

class BaseForceField extends DestroyableEntity
{
	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		
		
		config.collisionCategory = 4;
		config.collidesWith = 1;
		super(world, config);
		
	}
	
	
}