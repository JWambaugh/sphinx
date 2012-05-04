package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;
import nme.display.Bitmap;
import nme.Assets;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class WeakForceField extends BaseForceField
{
	
	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		
		super(world, config);
		health = 45;
		setZPosition(5);
	}
	
}