package org.wambaugh.sphinx.entities;

import firmament.core.FPhysicsEntity;
import firmament.core.FPhysicsWorld;
import org.wambaugh.sphinx.map.DestroyableEntity;

/**
 * ...
 * @author Jordan Wambaugh
 */

class BadGuy extends DestroyableEntity
{
	
	
	public function new(world:FPhysicsWorld, config:Dynamic) 
	{
		config.collisionCategory = 2;
		config.collidesWith = 11;
		super(world, config);
	}
	
	}
