package com.tomseysdavies.ember.demos.bunnies.systems.nodes
{
	import com.tomseysdavies.ember.demos.bunnies.components.GraphicComponent;
	import com.tomseysdavies.ember.demos.bunnies.components.SpatialComponent;
	import com.tomseysdavies.ember.entitySystem.impl.Node;
	

	
	public class RendererNode extends Node
	{
		public var spatial:SpatialComponent;
		public var graphic:GraphicComponent;
	}
}