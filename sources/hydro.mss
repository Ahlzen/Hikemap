/* TODO: Separate major waterways/waterbodies below z12 */


////// Wetlands

// TODO: use pattern!

#nhdWetland [zoom >= 10] {
	 polygon-pattern-file: url(../symbols/marsh.png);
}


////// Rivers, streams etc...

#nhdPerennialStream [zoom >= 12] {
	line-color: @wateroutline;
	line-width: 0.4;
	[zoom >= 12] { line-width: 0.6; }
	[zoom >= 14] { line-width: 1.0; }
	[zoom >= 16] { line-width: 1.5; }
}

#nhdIntermittentStream [zoom >= 12] {
	line-color: @wateroutline;
	line-width: 0.4;
	line-dasharray: 6,3;
	[zoom >= 12] { line-width: 0.6; }
	[zoom >= 14] { line-width: 1.0; }
	[zoom >= 16] { line-width: 1.5; }
}


////// Water bodies (lakes, ponds, wide rivers etc) and ocean

// NOTE: use double line-width, since half will
// be overdrawn by the fill

// TODO: use generalized coastline polys at lower zoom levels
// TODO: use coastline shapefiles rather than "raw" OSM

#coastline [zoom >= 8],
#nhdWaterPoly [zoom >= 8] {
	line-color: @wateroutline;
	line-width: 0.4;
	[fcode = 39001],[fcode = 46003],[fcode = 46007] {
		line-dasharray: 6,3; // Intermittent/ephemeral
	}
	[zoom >= 10] { line-width: 0.6; }
	[zoom >= 12] { line-width: 1.0; }
	[zoom >= 14] { line-width: 1.5; }
	[zoom >= 16] { line-width: 2.5; }
}

#ocean,
#nhdWaterPoly::fill [zoom >= 8] {
	polygon-fill: @waterfill;
}


////// Hydrological barriers: Dams, weirs, etc

// TODO: Change to z12+

.hydro_barrier [zoom >= 10] {
	line-color: black;
	line-width: 1.5;
	
}

.hydro_barrier_filled::fill [zoom >= 10] {
	polygon-fill: #666;
}
