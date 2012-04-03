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

	public function new(world:FPhysicsWorld) 
	{
		var config:Dynamic = { };
		config.type = "static";
		config.sprite = new Bitmap(Assets.getBitmapData("assets/sandDunes.png"));
		config.imageScale =100;
		config.shapes = [
			{
				type:'box'
				,width:10.17
				,height:3.12
				,restitution:.1
				,density:.5
				,friction:.7
			}
			];
		config.collisionCategory = 8;
		config.collidesWith = 3;
		config.position = new FVector(0,2);
		super(world,config);
	}
	
}