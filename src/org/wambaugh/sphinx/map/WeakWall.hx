package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;

/**
 * ...
 * @author Gunnar Wambaugh
 */

class WeakWall extends BasicWall
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.type = "dynamic";
		config.shapes = [
		{
			type:'box'
			,width:.07
			,height:.7
			,restitution:.1
			,density:.5
			,friction:.7
		}
		];
		super (world, config);
		strength = 100;
	}
	
}