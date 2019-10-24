-----------------
 Version History
-----------------

0.80 First version.
0.81 Added method MarkerHelper.PositionInsideAnyMarker.
     Renamed MarkerHalper.GetRandomPositionInsideMarker to MarkerHelper.GetRandomPosInsideMarker.
     Removed method MarkerHelper.PositionIsInsideMarker since the script command inArea does the same thing.
0.82 Fix: A static create method called the constructor of Marker with wrong number of arguments.
0.99 Added a Tag property so that markers can be tagged with meaningful values or objects.
     Changed information stored in private fields to public properties.
     Added setter methods for all properties.
1.0  Added possibility to create local markers.
     Added create methods for local markers.
     Added public properties for all marker settings.
     Added setter methods for all marker settings.
     Added property "Tag" to store any interesting information.
     