<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page contentType="application/pdf"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="java.io.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%
    try {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/HotelliBD", 
                "postgres", 
                "12345");
        
        String jrxmlFile= session.getServletContext().getRealPath(
        "/WEB-INF/jsp/reservacion/reportRev.jrxml");
        
        InputStream input=new FileInputStream(new File(jrxmlFile));
        
        JasperReport jasperReport = JasperCompileManager.compileReport(input);
        
        JasperPrint jasperPrint = JasperFillManager.fillReport(
                jasperReport,
                null, 
                con);
        JasperExportManager.exportReportToPdfStream(
                jasperPrint,
                response.getOutputStream());
        
        response.getOutputStream().flush();
        response.getOutputStream().close();
    
    } catch (Exception e) {
        System.out.println("Error");
        e.printStackTrace();
    }
%>