<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Ordine" %>
<%@ page import="model.OrdineDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ordine DAO</title>
</head>
<body>
    <%
        // Inserisci qui il codice per interagire con il tuo OrdineDAO
        OrdineDAO ordineDao = new OrdineDAO();
        // Esempio: Recupera tutti gli ordini e li visualizza
        List<Ordine> ordini = ordineDao.getAll();
        for(Ordine ordine : ordini) {
            out.println("Ordine ID: " + ordine.getOrder_ID() + "<br>");
        }
    %>
</body>
</html>