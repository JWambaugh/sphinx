package org.wambaugh.sphinx.map;
import firmament.core.FPhysicsWorld;
import nme.display.Bitmap;
import nme.Assets;
import firmament.core.FPhysicsEntity;
import firmament.core.FVector;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class StrongWall extends BaseWall
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		
		super (world, config);
		health = 150;
	}
	override public function takeDamage() {
		if (dead) return;
		if (health < 75) {
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
				var randomY = this.getPositionY() + (Math.random() * .2) - .2;
				var randomX = this.getPositionX() + (Math.random() * .2) - .2;
				ent = new FPhysicsEntity(cast(world),{
					sprite:Assets.getBitmapData("assets/StrongChardWall" + num + ".png")
					,type:"dynamic"
					,angle: Math.random()*6.28
					,position: new FVector (randomX, randomY)
					,imageScale:589
					,maxLifeSeconds:.5+ Math.random()*1
					,shapes:[{
						type:'box'
						,width: debrisArray[num-1][0]
						,height: debrisArray[num-1][1]
						,restitution:.1
						,density:.01
						,friction:.1
					}]
				});			
			}	
		}
	}
}