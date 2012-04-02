package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;

/**
 * ...
 * @author Gunnar Wambaugh
 */

class WeakForceField extends BaseForceField
{
	
	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.type = "static";
		config.shapes = [
		{
			type:'circle'
			,radius:.37
			,restitution:.8
			,friction:0
		}
		];
		super(world,config);
	}
	
}