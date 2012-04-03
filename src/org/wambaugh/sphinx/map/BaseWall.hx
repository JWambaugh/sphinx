package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;
import firmament.core.FGame;
import firmament.core.FPhysicsCollisionEvent;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class BaseWall extends DestroyableEntity
{
	
	public function new(world:FPhysicsWorld, config:Dynamic)
	{
		
		super (world, config);
	}
	
	
	
}