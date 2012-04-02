package org.wambaugh.sphinx.entities;

import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;

/**
 * ...
 * @author Jordan Wambaugh
 */

class BadGuy extends FPhysicsEntity
{
	var health:Int;
	
	public function new(world:FPhysicsWorld, config:Dynamic) 
	{
		
		super(world, config);
	}
	public function getHealth():Int{
		
		return health;
	}
}