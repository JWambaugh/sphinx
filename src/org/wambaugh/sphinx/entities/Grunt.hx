package org.wambaugh.sphinx.entities;
import firmament.core.FPhysicsWorld;

/**
 * ...
 * @author Gunnar Wambaugh
 */

class Grunt extends BadGuy
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.type = "dynamic";
		config.shapes = [
			{ 
				type: 'box'
				,width:.2
				,height:.3
				,restitution:.1
				,density:.5
				,friction:.7
				}
				];
		super(world, config);
		health = 100;
	}
	
}