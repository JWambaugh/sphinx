package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;
import nme.display.Bitmap;
import nme.Assets;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class StrongForceField extends BaseForceField
{
	
	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.sprite =Assets.getBitmapData("assets/StrongForceField.png");
		config.type = "static";
		config.imageScale = 377;
		config.shapes = [
		{
			type:'circle'
			,radius:config.radius
			//,radius = .35
			,restitution:.8
			,friction:0
		}
		];
		super(world, config);
		health = 225;
		setZPosition(5);
	}
	
}