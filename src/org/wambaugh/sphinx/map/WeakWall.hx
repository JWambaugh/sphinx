package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;
import nme.display.Bitmap;
import nme.Assets;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class WeakWall extends BaseWall
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.sprite = new Bitmap(Assets.getBitmapData("assets/weakWall.png"));
		config.type = "dynamic";
		config.imageScale = 589;
		config.shapes = [
		{
			type:'box'
			,width:.151
			,height:.7
			,restitution:.1
			,density:.7
			,friction:.7
		}
		];
		super (world, config);
		health = 100;
	}
	
}