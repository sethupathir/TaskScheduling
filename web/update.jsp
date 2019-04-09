<%@page import="java.sql.*"%>
<%
String ide=request.getParameter("id");
int num=Integer.parseInt(ide);
String name=request.getParameter("anine");
String address=request.getParameter("aten");
String aele=request.getParameter("aele");
String atwe=request.getParameter("atwe");
String aone=request.getParameter("aone");
String atwo=request.getParameter("atwo");
String athree=request.getParameter("athree");
String afour=request.getParameter("afour");
String afive=request.getParameter("afive");
String asix=request.getParameter("asix");
String aseven=request.getParameter("aseven");


String rnine=request.getParameter("rnine");
String rten=request.getParameter("rten");
String rele=request.getParameter("rele");
String rtwe=request.getParameter("rtwe");
String rone=request.getParameter("rone");
String rtwo=request.getParameter("rtwo");
String rthree=request.getParameter("rthree");
String rfour=request.getParameter("rfour");
String rfive=request.getParameter("rfive");
String rsix=request.getParameter("rsix");
String rseven=request.getParameter("rseven");





try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root", "");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update dts set anine='"+name+"',aten='"+address+"',aele='"+aele+"',atwe='"+atwe+"',aone='"+aone+"',atwo='"+atwo+"',athree='"+athree+"',afour='"+afour+"',afive='"+afive+"',asix='"+asix+"'"
        + ",aseven='"+aseven+"',rnine='"+rnine+"',rten='"+rten+"',rele='"+rele+"',rtwe='"+rtwe+"',rone='"+rone+"',rtwo='"+rtwo+"',rthree='"+rthree+"',rfour='"+rfour+"',rfive='"+rfive+"',rsix='"+rsix+"'"
        + ",rseven='"+rseven+"' where id='"+num+"'");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('updated successfully');");
                out.println("location='viewdts.jsp';");
                out.println("</script>");
}
catch(Exception e){
System.out.println(e);
}
%>