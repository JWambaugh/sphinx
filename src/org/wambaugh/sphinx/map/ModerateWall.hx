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

class ModerateWall extends BaseWall
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		
		super (world, config);
		health = 100;
	}
	override public function takeDamage() {
		if (dead) return;
		if (health < 50) {
			this.currentImage = Assets.getBitmapData("assets/ModerateWallCracked.png");
		}
		var debrisArray = [
			[.0594,.1817 ]
			,[.0643,.1681 ]
			,[.0611,.2224 ]
			,[.1358,.1426 ]
			,[.0679,.1596 ]
			
		];
		
		if (health <= 0) {
			
			for (num in 1 ... 6) {
				var ent;
				var randomY = this.getPositionY() + (Math.random() * .2) - .2;
				var randomX = this.getPositionX() + (Math.random() * .2) - .2;
				ent = new FPhysicsEntity(cast(world),{
					sprite:Assets.getBitmapData("assets/ModChardWall" + num + ".png")
					,type:"dynamic"
					,objType: "Shrapnel"
					,angle: Math.random()*6.28
					,position: new FVector (randomX,randomY)
					,imageScale:589
					,maxLifeSeconds:.5+ Math.random()*1
					,shapes:[{
						type:'box'
						,width: debrisArray[num-1][0]
						,height: debrisArray[num-1][1]
						,restitution:0
						,density:.01
						,friction:.9
					}]
				});
				
				
				
			}	
		}
	}
}