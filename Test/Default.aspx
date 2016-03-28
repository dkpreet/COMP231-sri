

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Test.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:gridview ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
         <Columns>
             <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkRow" runat="server" AutoPostBack="true" OnCheckedChanged="ChckedChanged" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Course_Code" HeaderText="Course Code" ItemStyle-Width="150" ReadOnly="True" SortExpression="Course_ID" />
        <asp:BoundField DataField="Course_Number" HeaderText="Course Number" ItemStyle-Width="250" ReadOnly="True" SortExpression="Course_Name" />
        <asp:BoundField DataField="Course_Name" HeaderText="Course Name" ItemStyle-Width="250" ReadOnly="True" SortExpression="Course_Name" />
    </Columns>
    </asp:gridview>



        <br />


          <asp:gridview ID="GridView2" runat="server" AutoGenerateColumns="False">
         <Columns>
          <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkRow2" runat="server" AutoPostBack="true" OnCheckedChanged="ChckedChanged" />
            </ItemTemplate>
            </asp:TemplateField>
                     <asp:BoundField DataField="Course_Name" HeaderText="Course Name" ItemStyle-Width="150" ReadOnly="True" />
                     <asp:BoundField DataField="section_ID" HeaderText="Section" ItemStyle-Width="150" ReadOnly="True" />
                     <asp:BoundField DataField="Day" HeaderText="Day" ItemStyle-Width="150" ReadOnly="True" />
                     <asp:BoundField DataField="S_Time" HeaderText="Start" ItemStyle-Width="150" ReadOnly="True" />
             <asp:BoundField DataField="E_Time" HeaderText="End Time" ItemStyle-Width="150" ReadOnly="True" />       
    </Columns>
     </asp:gridview>

        

                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show Available Sections" />

        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:courseregistrationConnectionString %>" ProviderName="<%$ ConnectionStrings:courseregistrationConnectionString.ProviderName %>" SelectCommand="SELECT * FROM courseregistration.course;"></asp:SqlDataSource>--%>
        <asp:Button ID="Button2" runat="server" Text="Enroll the Selected Sections" />
    </div>
    </form>
</body>
</html>
