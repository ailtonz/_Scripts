Attribute VB_Name = "mdl_MsAccess2MySql"
Option Compare Database

Private Sub ProcedureCreate()
'' CRIAR MODELO DE PROCEDURES COM SYNTAXE MYSQL
Dim db As Database
Dim tdf As TableDef
Dim x As Integer
Dim sSQL As String
Dim sInsert As String
Dim sUpdate As String

Dim sTmp As String
Dim sTmp2 As String

sTmp = "DELIMITER ;;" & vbNewLine
sTmp = sTmp & "DROP PROCEDURE IF EXISTS `dpPROCEDURE`;" & vbNewLine
sTmp = sTmp & "CREATE PROCEDURE `spPROCEDURE` p_PARAMETER" & vbNewLine
sTmp = sTmp & "BEGIN" & vbNewLine
sTmp = sTmp & "IF p_ID = ""0"" THEN " & vbNewLine
sTmp = sTmp & " INSERT INTO tbl_Tabela " & vbNewLine
sTmp = sTmp & "         ( fldCAMPOS_TABELA ) " & vbNewLine
sTmp = sTmp & "    VALUES  " & vbNewLine
sTmp = sTmp & "         ( fldCAMPOS_PARAMETROS ); " & vbNewLine
sTmp = sTmp & "ELSEIF p_ID <> ""0"" THEN " & vbNewLine
sTmp = sTmp & " IF p_NOME <> """" THEN " & vbNewLine
sTmp = sTmp & "     UPDATE tbl_Tabela " & vbNewLine
sTmp = sTmp & "         SET  " & vbNewLine
sTmp = sTmp & "             fldCAMPOS_ATUALIZACAO " & vbNewLine
sTmp = sTmp & "         WHERE ID = p_ID; " & vbNewLine
sTmp = sTmp & " ELSE " & vbNewLine
sTmp = sTmp & "     DELETE FROM tbl_Tabela WHERE ID = p_ID; " & vbNewLine
sTmp = sTmp & " END IF; " & vbNewLine
sTmp = sTmp & "END IF;  " & vbNewLine
sTmp = sTmp & "END ;;" & vbNewLine
sTmp = sTmp & "DELIMITER ;" & vbNewLine

Set db = CurrentDb

For Each tdf In db.TableDefs
    If Left(tdf.Name, 4) <> "MSys" Then ' Don't enumerate the system tables
        
        '' PARAMETROS
        sSQL = ""
        sSQL = sSQL & "("
        
        For x = 0 To tdf.Fields.Count - 1
           sSQL = sSQL & "IN " & "p_" & tdf.Fields(x).Name & IIf(Left(tdf.Fields(x).Name, 2) = "ID", " INT,", " VARCHAR(50),")
        Next x
        sSQL = Left(sSQL, Len(sSQL) - 1) & ")"

        '' CARREGAR LAYOUT
        sTmp2 = sTmp
        
        '' DROP PROCEDURE
        sTmp2 = Replace(sTmp2, "dpPROCEDURE", Replace(Replace(tdf.Name, "tbl", "sp"), "_", ""))
        
        '' CREATE PARAMETERS
        sTmp2 = Replace(sTmp2, "p_PARAMETER", sSQL)
        
        '' CREATE PROCEDURE
        sTmp2 = Replace(sTmp2, "spPROCEDURE", Replace(Replace(tdf.Name, "tbl", "sp"), "_", ""))
                
        '' CAMPOS DA TABELA
        sTmp2 = Replace(sTmp2, "fldCAMPOS_TABELA", listFields(tdf.Name))

        '' PARAMETROS DA PROCEDURE
        sTmp2 = Replace(sTmp2, "fldCAMPOS_PARAMETROS", listFields(tdf.Name, "p_"))
                
        '' PARAMETROS - UPDATE
        sUpdate = ""
        For x = 0 To tdf.Fields.Count - 1
            If Left(tdf.Fields(x).Name, 2) = "ID" Then
                sUpdate = sUpdate & tdf.Fields(x).Name & " = p_" & tdf.Fields(x).Name & ","
            Else
                sUpdate = sUpdate & tdf.Fields(x).Name & " = " & "trim(ucase(p_" & tdf.Fields(x).Name & ")),"
            End If
        Next x
        sUpdate = Left(sUpdate, Len(sUpdate) - 1) & ""
        
        sTmp2 = Replace(sTmp2, "fldCAMPOS_ATUALIZACAO", sUpdate)
        
        '' TABLE
        sTmp2 = Replace(sTmp2, "tbl_Tabela", tdf.Name)
                
        GerarSaida sTmp2, "saida.log"
        
    End If
Next tdf

db.Close

End Sub


Public Function GerarSaida(strConteudo As String, strArquivo As String)
'' GERAR ARQUIVO DE LOG
    
    Open Application.CurrentProject.Path & "\" & strArquivo For Append As #1
    Print #1, strConteudo
    Close #1

End Function

Sub Obj()
'' CONSULTA PARA LISTAR TABELAS DO ACCESS
''SELECT MSysObjects.name FROM MSysObjects WHERE (((MSysObjects.name)<>"tmpObj") AND ((MSysObjects.Type)=1) AND ((MSysObjects.Flags)=0));

'' RELAÇÃO DE TABELAS PARA ALTERAÇÕES
Dim rst As DAO.Recordset: Set rst = CurrentDb.OpenRecordset("Select * from tmpObj where OK =0")
Dim sql As String

    While Not rst.EOF
    
    'sql = "ALTER TABLE " & rst.Fields("nome").Value & " add ID_EMPRESA long"
    If rst.Fields("CampoChave").Value <> "" Then
    
'        '' RENAME COLUMN
'        'sql = "ALTER TABLE " & rst.Fields("nome").Value & " RENAME " & Replace(rst.Fields("CampoChave").Value, "PK_", "") & " TO " & rst.Fields("CampoChave").Value
'
'        '' ADD COLUMN
'        sql = "ALTER TABLE " & rst.Fields("nome").Value & " ADD " & rst.Fields("CampoChave").Value & " char(255)"
'            Debug.Print sql
'            DoCmd.RunSQL sql, 0
'
'        '' UPDATE ENTRE CAMPOS
'        sql = "UPDATE " & rst.Fields("nome").Value & " SET " & rst.Fields("CampoChave").Value & " = " & Replace(rst.Fields("CampoChave").Value, "PK_", "")
'            Debug.Print sql
'            DoCmd.RunSQL sql, 0
'
'        '' DROP COLUMN
'        sql = "ALTER TABLE " & rst.Fields("nome").Value & " DROP COLUMN " & Replace(rst.Fields("CampoChave").Value, "PK_", "")
'            Debug.Print sql
'            DoCmd.RunSQL sql, 0
    
    
    End If
    
    rst.MoveNext
    
    Wend

CurrentDb.Close

End Sub

Public Function listFields(strTable As String, Optional strSufix As String) As String
'' LISTA DE CAMPOS DE TABELAS
Dim db As Database
Dim tdf As TableDef
Dim x As Integer
Dim tmp As String

Set db = CurrentDb

For Each tdf In db.TableDefs
   If Left(tdf.Name, 4) <> "MSys" And tdf.Name = strTable Then ' Don't enumerate the system tables
      For x = 0 To tdf.Fields.Count - 1
          tmp = tmp & strSufix & tdf.Fields(x).Name & ","
      Next x
   End If
Next tdf

listFields = Left(tmp, Len(tmp) - 1) & ""

End Function

Private Sub ProcedureDrop()
'' CRIAR MODELO DE PROCEDURES COM SYNTAXE MYSQL
Dim db As Database
Dim tdf As TableDef
Dim x As Integer

Dim sTmp As String: sTmp = "DROP PROCEDURE IF EXISTS `dpPROCEDURE`;"
Dim sTmp2 As String

Set db = CurrentDb

For Each tdf In db.TableDefs
    sTmp2 = ""
    If Left(tdf.Name, 4) <> "MSys" Then ' Don't enumerate the system tables
        sTmp2 = sTmp
        sTmp2 = Replace(sTmp2, "dpPROCEDURE", Replace(Replace(tdf.Name, "tbl", "sp"), "_", ""))
        GerarSaida sTmp2, "saida2.log"
    End If
    
Next tdf

db.Close

End Sub
