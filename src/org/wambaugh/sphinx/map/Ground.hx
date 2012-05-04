package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;
import firmament.core.FVector;
import nme.display.Bitmap;
import nme.Assets;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class Ground extends FPhysicsEntity
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		
		config.collidesWith =  1|2|8|32;
		super(world,config);
	}
	
}