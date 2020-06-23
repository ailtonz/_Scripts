dim app
set app = createobject("Excel.Application")

app.Visible = true

dim wb
set wb = app.workbooks.open("C:\temp\projects\tools_scripts\dbModelos\CalculoPreco-v02.xls")

For Each ws In app.Worksheets
	If ws.Name <> "Custos" Then
		ws.Visible = xlSheetVeryHidden
	End If
Next
