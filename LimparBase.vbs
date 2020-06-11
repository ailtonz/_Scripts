Dim oFSO, oFolder, oFile, app, wb 
 
set oFSO = CreateObject("Scripting.FileSystemObject")
Set oFolder = oFSO.GetFolder("C:\temp\")

For Each oFile In oFolder.Files
	set app = createobject("Excel.Application")
	set wb = app.workbooks.open(oFile.Path)
	For Each ws In app.Worksheets
		If ws.Visible = xlSheetHidden Then
			ws.Delete
		End If
	Next	
	wb.Save
	app.Quit 
Next

MsgBox("Concluido")