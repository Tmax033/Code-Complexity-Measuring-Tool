<%@page import="service.*"%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Control Result</title>

<style>
#tab-01 {
  border-collapse: collapse;
  width: 100%;
}

#tab-01 td, #tab-01 th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tab-01 tr:nth-child(even){background-color: #f2f2f2;}

#tab-01 tr:hover {background-color: #ddd;}

#tab-01 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #a3a3a3;
  color: white;
}
</style>
</head>
<body>
	
	<h1>Code Complexity due to Control</h1>
	<table id="tab-01"  class="content-table">
	<tr>
	<thead>
		<th>Line no</th>
		<th>Program statements</th>
		<th>Wtcs</th>
		<th>NC</th>
		<th>Ccspps</th>
		<th>Ccs</th>
	</tr>
	</thead>
	<tbody>
		<%
			Control test3 = new Control();
		int condition= Integer.parseInt(session.getAttribute("condition").toString());
		int loop = Integer.parseInt(session.getAttribute("loop").toString());
		int switchCase= Integer.parseInt(session.getAttribute("switchCase").toString());
		int caseOnly=Integer.parseInt(session.getAttribute("caseOnly").toString());
	ArrayList<Controls> arrayList3 = test3.control(session.getAttribute("test_code").toString(),condition,loop,switchCase,caseOnly);
	
	for (Controls control : arrayList3) {
		int total = (control.getLine_weight()*control.getNo_of_control())+control.getCspps();
%>
		<tr>
			<td><%=control.getLineNumber() %></td>
			<td><%=control.getLine() %></td>
			<td><%=control.getLine_weight() %></td>
			<td><%=control.getNo_of_control() %></td>
			<td><%=control.getCspps() %></td>
			<td><%=total %></td>
		</tr>
		<% 
	}	
%>
	</tbody>
	</table>

</body>
</html>