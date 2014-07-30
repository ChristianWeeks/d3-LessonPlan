ogr2ogr \
	-f GeoJSON \
	-where "ADM0_A3 IN ('USA')" \
	json/states.json \
	VectorFiles/ne_10m_admin_1_states_provinces.shp

ogr2ogr \
	-f GeoJSON \
	-where "ADM0_A3 IN ('USA') AND SCALERANK < 5" \
	json/cities.json \
	VectorFiles/ne_10m_populated_places.shp

topojson \
	-o json/USA.json \
	--id-property SU_A3 \
	--properties name=NAME \
	-- \
	json/states.json \
	json/cities.json
