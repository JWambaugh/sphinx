package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;

/**
 * ...
 * @author Gunnar Wambaugh
 */

class BasicWall extends FPhysicsEntity 
{
	var strength:Int; 
	public function new(world:FPhysicsWorld, config:Dynamic)
	{
		super (world, config);
	}
	public function getStrength():Int {
		return strength;
	}
}