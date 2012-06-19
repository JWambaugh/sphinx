package org.wambaugh.sphinx.entities;
import firmament.core.FPhysicsWorld;
import firmament.core.FVector;
import nme.display.Bitmap;
import nme.Assets;
import firmament.core.FPhysicsEntity;
import firmament.utils.loader.FEntityLoader;
/**
 * ...
 * @author Gunnar Wambaugh
 */

class Queen extends BadGuy
{

	public function new(world:FPhysicsWorld,config:Dynamic) 
	{
		super(world, config);
		health = 30;
	}
	override public function takeDamage() {
		if (dead) {
			return;
		}
		if (this.health < 30 && this.health > 0) {
			for (count in 1 ... 3) {
				trace('spawning');
				var thisY = this.getPositionY() + (Math.random() * .5) - .2;
				var thisX = this.getPositionX() + (Math.random() * .5) - .2;
				var grunt= FEntityLoader.getInstance().loadEntity('assets/entities/grunt.json',this.world,{position:new FVector (thisX,thisY)});
			}
			return;
		}
		
		if (this.health <= 0) {
			
			for ( count in 1 ... 10) {
				var randomY = this.getPositionY() + (Math.random() * .5) - .2;
				var randomX = this.getPositionX() + (Math.random() * .5) - .2;
				var ent = new FPhysicsEntity(cast(this.world),{
					sprite: Assets.getBitmapData("assets/AlienBlood.png")
					,type:"dynamic"
					,objType: "Shrapnel"
					,position: new FVector (randomX,randomY)
					,imageScale:712
					,maxLifeSeconds:.25+ Math.random()*.25
					,shapes:[ {
							type:'box'
							,height:.0478
							,width:.0478
							,restitution:.2
							,density:.1
							,friction:.9
						}]
					,collisionCategory:32 
					,collidesWith:1|2|8
					});
				}
			}
		}
	
}