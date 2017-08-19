Sub createListSql()

Dim ws As Worksheet: Set ws = Worksheets("sheet1")
Dim lRow As Long: lRow = ws.Cells(Rows.Count, 1).End(xlUp).Offset(1, 0).Row
Dim i As Long:  i = 2
Dim sScript As String: sScript = "SELECT * FROM ( VALUES "
Dim t As String

For i = 2 To lRow - 1
    t = t + "('" & ws.Range("A" & i).Value & "'),"
Next

sScript = sScript + Left(t, Len(t) - 1) + ") AS list(item)"

Debug.Print sScript

End Sub
