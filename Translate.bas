Function Translate(sText, FromLang, ToLang)
    Dim p1, p2, URL, resp
    Const DIV_RESULT$ = "<div class=""result-container"">"
    Const URL_TEMPLATE$ = "https://translate.google.com/m?hl=[from]&sl=[from]&tl=[to]&ie=UTF-8&prev=_m&q="
    URL = URL_TEMPLATE & WorksheetFunction.EncodeURL(sText)
    URL = Replace(URL, "[to]", ToLang)
    URL = Replace(URL, "[from]", FromLang)
    resp = WorksheetFunction.WebService(URL)
    p1 = InStr(resp, DIV_RESULT)
    If p1 Then
        p1 = p1 + Len(DIV_RESULT)
        p2 = InStr(p1, resp, "</div>")
        Translate = Mid$(resp, p1, p2 - p1)
    End If
End Function
