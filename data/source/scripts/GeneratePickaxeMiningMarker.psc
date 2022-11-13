Scriptname GeneratePickaxeMiningMarker extends ObjectReference  

bool Property initialised auto

Furniture Property FloorMarkerBase  Auto  
Furniture Property WallMarkerBase  Auto  
Furniture Property TableMarkerBase  Auto 

MineOreFurnitureScript Property markerScript Auto


Event OnCellAttach()
	
	Debug.Notification("Loaded mine " + GetFormID() + " with state " + initialised)
	
	if (self.initialised != true)
		CreatePickaxeMarker()
	else
		Debug.Notification("Enabled " + markerScript.IsEnabled())
		Debug.Notification("Rendered " + markerScript.Is3DLoaded())
		DEbug.Notification("Id " + markerScript.GetFormId())
		DEbug.Notification("LinkedRefId " + markerScript.GetLinkedRef().GetFormId())
	endif
	
	self.initialised = true

EndEvent

Event OnActivate(ObjectReference akActionRef)
	Debug.Trace("Activated by " + akActionRef)
	Debug.Notification("Activate")
	Debug.Notification("Enabled " + markerScript.IsEnabled())
	Debug.Notification("Rendered " + markerScript.Is3DLoaded())
EndEvent

Function CreatePickaxeMarker()
	Debug.Notification("Creating pickaxe marker")
	Form selectedMarker = SelectMarker()
	ObjectReference newMarker = PlaceAtMe(selectedMarker)
	markerScript = newMarker as MineOreFurnitureScript
	markerScript.SetScale(5.0)
	markerScript.Enable(true)
	Debug.Notification("Enabled " + markerScript.IsEnabled())
	Debug.Notification("Rendered " + markerScript.Is3DLoaded())
	DEbug.Notification("Id " + markerScript.GetFormId())
	DEbug.Notification("LinkedRefId " + markerScript.GetLinkedRef().GetFormId())
EndFunction


Form Function SelectMarker()
	Form aForm = FloorMarkerBase
	Return aForm
EndFunction
