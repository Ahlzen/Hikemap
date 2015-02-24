//// Special landcover (natural=*)

#naturalLandcover [zoom >= 12] {

	// TODO: Use .svg versions when carto/mapnik supports it

	// Bare rock
	[natural='rock'],
	[natural='bare_rock'],
	[natural='cliff'] {
		polygon-pattern-file: url(../symbols/rock.png);
		polygon-pattern-opacity: 0.6;
	}

	// Loose rock / scree
	[natural='scree'] {
		polygon-pattern-file: url(../symbols/scree.png);
		polygon-pattern-opacity: 0.6;
	}
}
