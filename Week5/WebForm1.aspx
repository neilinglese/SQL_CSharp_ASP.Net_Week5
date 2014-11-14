<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Week5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CustState" DataValueField="CustState">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="CustCity" DataValueField="CustCity">
        </asp:DropDownList>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="CustFirstName" HeaderText="CustFirstName" SortExpression="CustFirstName" />
                <asp:BoundField DataField="CustLastName" HeaderText="CustLastName" SortExpression="CustLastName" />
                <asp:BoundField DataField="CustStreetAddress" HeaderText="CustStreetAddress" SortExpression="CustStreetAddress" />
                <asp:BoundField DataField="CustCity" HeaderText="CustCity" SortExpression="CustCity" />
                <asp:BoundField DataField="CustState" HeaderText="CustState" SortExpression="CustState" />
                <asp:BoundField DataField="CustZipCode" HeaderText="CustZipCode" SortExpression="CustZipCode" />
                <asp:BoundField DataField="CustAreaCode" HeaderText="CustAreaCode" SortExpression="CustAreaCode" />
                <asp:BoundField DataField="CustPhoneNumber" HeaderText="CustPhoneNumber" SortExpression="CustPhoneNumber" />
            </Columns>
            <SelectedRowStyle BackColor="#3399FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SalesOrdersExampleConnectionString %>" SelectCommand="SELECT * FROM [Customers] where Customers.CustState = @states and Customers.CustCity = @cities">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="states" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" Name="cities" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SalesOrdersExampleConnectionString %>" SelectCommand="SELECT DISTINCT [CustState] FROM [Customers]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SalesOrdersExampleConnectionString %>" SelectCommand="SELECT DISTINCT [CustCity] FROM [Customers] where Customers.CustState = @states">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="states" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="OrderNumber" HeaderText="OrderNumber" SortExpression="OrderNumber" />
                <asp:BoundField DataField="QuotedPrice" HeaderText="QuotedPrice" SortExpression="QuotedPrice" />
                <asp:BoundField DataField="QuantityOrdered" HeaderText="QuantityOrdered" SortExpression="QuantityOrdered" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="ShipDate" HeaderText="ShipDate" SortExpression="ShipDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SalesOrdersExampleConnectionString %>" SelectCommand="select Products.ProductName, Order_Details.OrderNumber, Order_Details.QuotedPrice, Order_Details.QuantityOrdered, Orders.OrderDate,Orders.ShipDate from Products
inner join Order_Details on Order_Details.ProductNumber = Products.ProductNumber
inner join Orders on Orders.OrderNumber = Order_Details.OrderNumber
inner join Customers on Customers.CustomerID = Orders.CustomerID
where Customers.CustomerID = @cust and Orders.OrderDate &gt;= @from and Orders.OrderDate &lt;= @to">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="cust" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="Calendar1" Name="from" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" Name="to" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
