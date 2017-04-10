<%@ Page Language="C#"  Debug="true"%>

<%@ Import Namespace="AutoLotConnectedLayer" %>
<%@ Assembly Src="AutoLotDAL.cs" %>

<!DOCTYPE html>
<script runat="server">
    protected void btnFillData_click(object sender, EventArgs e)
    {
        InventoryDAL dal = new InventoryDAL();
        dal.OpenConnection(@"Data Source=comp\SQLEXPRESS;Initial Catalog=AutoLot;Integrated Security=True");
        carsGridView.DataSource = dal.GetAllInventoryAsList();
        carsGridView.DataBind();
        dal.CloseConnection();
    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
    <style type="text/css">
        #form1 {
            height: 256px;
            width: 696px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">   
        <asp:Label ID="lblInfo" runat="server" Text="Click on the Button to Fill the Grid"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="carsGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <br />
        <asp:Button ID="btnFillData" runat="server" Height="40px" OnClick="btnFillData_click" style="margin:5px" Text="Fill Grid" Width="89px" />
    </form>
</body>
</html>
