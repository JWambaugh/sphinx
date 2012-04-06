package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;
import nme.display.Bitmap;
import nme.Assets;
import firmament.core.FPhysicsEntity;
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
		var debrisArray = [
			[.0441,.236 ]
			,[.034,.2224 ]
			,[.0917,.1324 ]
			,[.0662,.1851 ]
			,[.0289,.0815 ]
			
		];
		if (health <= 0) {
			for (num in 1 ... 6) {
				var ent;
				ent = new FPhysicsEntity(cast(world),{
					sprite:Assets.getBitmapData("assets/StrongChardWall" + num + ".png")
					,type:"dynamic"
					,angle: Math.random()*6.28
					,position:this.getPosition()
					,imageScale:589
					,maxLifeSeconds:.5+ Math.random()*2
					,shapes:[{
						type:'box'
						,width: debrisArray[num-1][0]
						,height: debrisArray[num-1][1]
						,restitution:.9
						,density:.1
						,friction:.1
					}]
				});			
			}	
		}
	}
}