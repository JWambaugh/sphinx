package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;
import nme.display.Bitmap;
import nme.Assets;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class StrongWall extends BaseWall
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		config.sprite = Assets.getBitmapData("assets/StrongWall.png");
		config.type = "dynamic";
		config.imageScale = 589;
		config.shapes = [
		{
			type:'box'
			,width:.151
			,height:.7
			,restitution:.1
			,density:.9
			,friction:.7
		}
		];
		super (world, config);
		health = 300;
	}
	override public function takeDamage() {
		if (dead) return;
		if (health < 150) {
			this.currentImage= Assets.getBitmapData("assets/StrongWallCracked.png");
		}
	}
}