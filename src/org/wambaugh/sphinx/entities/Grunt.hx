package org.wambaugh.sphinx.entities;
import firmament.core.FPhysicsWorld;
import nme.display.Bitmap;
import nme.Assets;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class Grunt extends BadGuy
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.sprite = Assets.getBitmapData("assets/alien.png");
		config.type = "dynamic";
		config.imageScale = 712;
		config.shapes = [
			{ 
				type: 'box'
				,width:.3441
				,height:.5
				,restitution:.1
				,density:.5
				,friction:.7
				}
				];
		super(world, config);
		health = 100;
	}
	
}