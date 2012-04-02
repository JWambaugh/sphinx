package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;

/**
 * ...
 * @author Gunnar Wambaugh
 */

class BaseForceField extends FPhysicsEntity
{
	var resistance:Int;
	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.collisionCategory = 4;
		config.collidesWith = 1;
		super(world, config);
	}
	public function getResistance():Int {
		return resistance;
	}
	
}