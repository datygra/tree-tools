-- FIND OMNIFOCUS FOLDERS/PROJECTS/TASKS/CONTEXTS WITH REUSABLE QUERIES
script
	on GetObjects(oDoc)
		tell application id " & quote & "OFOC" & quote & "
			tell oDoc to	return flattened " & strQuery & "
		end tell
	end GetObjects
end script
"
script
	property plstID : {}
	property plstValue : {}
	
	on GetObjects(oDoc)
		tell application id " & quote & "OFOC" & quote & "
			tell oDoc
				set refObjects to a reference to flattened " & strClass & "
				tell refObjects
					set {my plstID, my plstValue} to {id, " & strProp & "}
				end tell
				set lstObj to {}
				repeat with iObj from 1 to count of plstID
					set varRec to item iObj of plstValue
					if varRec is not missing value then
						if " & strCondition & " then ¬
							set end of lstObj to " & strSingleClass & " id (item iObj of plstID)
					end if
				end repeat
				return lstObj
			end tell
		end tell
	end GetObjects
end script
", ""}
set now to (current date)
set strDefault to short date string of now
"