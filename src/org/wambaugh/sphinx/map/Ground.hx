package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;
import firmament.core.FVector;

/**
 * ...
 * @author Gunnar Wambaugh
 */

class Ground extends FPhysicsEntity
{

	public function new(world:FPhysicsWorld) 
	{
		var config:Dynamic = { };
		config.type = "static";
		config.shapes = [
			{
				type:'box'
				,width:20
				,height:5
				,restitution:.1
				,density:.5
				,friction:.7
			}
			];
		config.position = new FVector(0,3);
		super(world,config);
	}
	
}