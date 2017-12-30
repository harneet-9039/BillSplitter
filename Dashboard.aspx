<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>


<HTML>
    <head>

         <!--linking of required files-->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
            <link rel="stylesheet" href="css/style.css">
              
            <meta name = "viewport" content = "width = device-width, initial-scale = 1">      
            <link rel = "stylesheet"
               href = "https://fonts.googleapis.com/icon?family=Material+Icons">
            <script type = "text/javascript"
               src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>           
            <script src = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js">

            </script>
           
          
           

          
          <!--modal functions-->
     
        <script type="text/javascript">
            var check = function () {
                $('#modal1').openModal();
               

            };

            var checkfrnd = function () {
                $('#modal2').openModal();


            };

            var checkgroup = function () {
                $('#modal3').openModal();


            };

            var check2 = function () {
                $('.modal').closeModal();


            };
           
            var check6 = function () {
                $('#modal1').closeModal();


            };
           


            var temp = function () {

                
                window.open('Default.aspx','_self');

            };

          
         
        </script>
           <style>
                .margin{
                    margin-left:30px;

                }
                .margin1{
                    margin-left:20%;

                }
                .sidebar{
                    
                    width: 200px;
                }
                .leftside {
                    position: absolute;
                    top: 0;
                    left: 0;
                    margin-top: 64px;
                    height: 92%;
                }
                .orange{
                    background-color: #202a37 !important;
                }
                .grey{
                    background-color: grey;
                }
            </style>

            <style>
            h4{
                 color: red;
                text-align: center;
             }

             .modalcenteralign{
                 margin-left: 30% !important;
             }
             .modalmargin{
                margin: -1% !important;
             }
             .modalwidth{
                 width:640px !important;
             }
            

                }
            
                .dropdownwidth{
                    width: 186px;
                }
        </style>

         <script type="text/javascript">
    $(function () {
        $("[id*=GridView2] td").click(function () {
            DisplayDetails($(this).closest("tr"));
        });
    });
    function DisplayDetails(row) {
        var message = document.getElementById(<%= HiddenField1%>);
        var id = "";
        message.value = $("td", row).eq(0).html();
        
       
    }
</script>
<script>

    function addGroupFields() {
        var number = document.getElementById("member1").value;
        var container = document.getElementById("container1");
        while (container.hasChildNodes()) {
            container.removeChild(container.lastChild);
        }
        for (i = 0; i < number; i++) {
            container.appendChild(document.createTextNode("Member " + (i + 1)+"    "));
            var input = document.createElement("input");
            input.type = "text";
            input.name = "groupmem" + i;
            input.style.width = "180px";
            container.appendChild(input);
            container.appendChild(document.createElement("br"));

        }
    }
</script>

<!--script to add dynamic elements to the div container-->
<script>
    function addFields() {
        var number = document.getElementById("member").value;
        var container = document.getElementById("container");
        while (container.hasChildNodes()) {
            container.removeChild(container.lastChild);
        }
        for (i = 0; i < number; i++) {
            container.appendChild(document.createTextNode("Member " + (i + 1)));
            var input = document.createElement("input");
            input.type = "text";
            input.name = "split" + i;
            input.style.width = "180px";
            container.appendChild(input);
            container.appendChild(document.createElement("br"));
            
        }
    }

   

    function addExactAmount(){
        var number = document.getElementById("member").value;
        var container = document.getElementById("exact");
        while (container.hasChildNodes()) {
            container.removeChild(container.lastChild);
        }
        for (i = 0; i <= number; i++) {
            container.appendChild(document.createTextNode("Member " + (i + 1)+":  "+"  "));
            var input = document.createElement("input");
            input.type = "text";
            input.id = "member1" + i;
            input.style.width = "180px";
            container.appendChild(input);
          
            container.appendChild(document.createElement("br"));

        }
        var btn = document.createElement("a");
        btn.id = "percenta";
        btn.className = "waves-effect waves-dark btn";
        
        btn.text = "Split";
        container.appendChild(btn);
        container.appendChild(document.createElement("br"));
        document.body.addEventListener('click', function (event) {
            if (event.srcElement.id == 'percenta') {
                AddExpense();

            };
        });



        
    }

        function addExactAmount1(){
            var number = document.getElementById("member").value;
            var container = document.getElementById("exact");
            while (container.hasChildNodes()) {
                container.removeChild(container.lastChild);
            }
            for (i = 0; i <= number; i++) {
                container.appendChild(document.createTextNode("Member " + (i + 1) + ":  " + "  "));
                var input = document.createElement("input");
                input.type = "text";
                input.id = "member1" + i;
                input.style.width = "180px";
                container.appendChild(input);
               
                container.appendChild(document.createElement("br"));
            }
            var btn = document.createElement("a");
            btn.id = "percentp";
            btn.className = "waves-effect waves-dark btn";
            btn.text = "Split";
            
            container.appendChild(btn);
            container.appendChild(document.createElement("br"));
            document.body.addEventListener('click', function (event) {
                if (event.srcElement.id == 'percentp') {
                    AddPercent();
                };
            });
            
            
            }

       
    
</script>

<!--functions to do exact amount and percent amount(partially functional)-->
 <script>
               function check4 () {
                   $('#modal4').openModal();


               };

               function check5() {
                   $('#modal4').closeModal();


               };
           </script>
       
<script>
    function AddExpense() {
        var number = document.getElementById("member").value;
        var sum = 0;
        for (i = 0; i <= number; i++) {
            var temp = document.getElementById("member1" + i);
            var fn = parseInt(document.getElementById("member1" + i).value, 10);
            var total = parseInt(document.getElementById("total").value, 10);
            sum = sum + fn;
        }

        if (sum == total) {
            alert("Sum is right");
        }

        else {
            alert("sum is not right");
        }
       
    }

    function AddPercent() {
        var number = document.getElementById("member").value;
        var sum = 0;
        for (i = 0; i <= number; i++) {
            var temp = document.getElementById("member1" + i);
            var fn = parseInt(document.getElementById("member1" + i).value);
            
            sum = sum + fn;
        }

        if (sum == 100) {
            alert("right");
        }

        else {
            alert("not right");
        }

    }
</script>

<!--end of method-->
        </head>
    <body>
        <form runat="server">
               <nav>
                    <div class="nav-wrapper orange">
                     <img src="logo1.png" style="width:50px; height:50px; margin-top:5px; margin-left:5px" />
                      <a href="#" class="brand-logo margin">Sahi Sahi Laga Lo!</a>
                      <ul id="nav-mobile" class="right hide-on-med-and-down">
                       
                      <li><img style="border-radius:50%;margin-right:10px;margin-top:15px;width:40px" runat="server" id="fb_img" src="add.jpg"></li><li><asp:Label ID="Label1" runat="server" Text="Undefined"></asp:Label></li><li><a class='dropdown-button navname dropdownwidth' href='#' data-activates='dropdown1'><i class="material-icons">arrow_drop_down</i></a></li>
                          
                        <ul id='dropdown1' class='dropdown-content' style="margin-right:30px">
                                <li><a href="#!"><i class="material-icons">account_circle</i>Your Account</a></li>
                                <li class="divider"></li>
                                <li><a class="modal-trigger" onclick="checkgroup();" href="#modal2"><i class="material-icons">group_add</i>Create a group</a></li>
                                <li class="divider"></li>
                                <li><a runat="server" onserverclick="Unnamed_ServerClick1"><i class="material-icons">exit_to_app</i>Logout</a></li>
                              </ul>
                      </ul>
                    </div>
        </nav>

            <div>                        
                        
                        <ul id="slide-out" class="side-nav fixed leftside">
                            
                            <li><a href="#!" class="waves-effect waves-teal" style="width: 361px; margin-left: -30px;margin-top:1px">
                                        <div class = "collapsible-header" style="background-color:grey">
                                        <i class = "material-icons">dashboard</i>Dashboard</div>
                                        </a>
                            </li>
                           
                            <br><br>
                            <li>
                               <a href="#!" style="margin-top:50px;width: 361px; margin-left: -30px;" class="waves-effect waves-teal"> <div class = "collapsible-header" onclick="checkgroup();" style="background-color:grey">
                                    <i class = "material-icons">group_add</i>Groups</div>Groups</a><br /><asp:GridView ID="GridView1" ShowHeader="false" runat="server" style="margin-left: 88px;margin-top: -37px;">
                       </asp:GridView>
                            </li>
                           
                            <br><br>
                            <li><a class="waves-effect waves-teal modal-trigger" style="width: 361px; margin-left: -30px;" onclick="checkfrnd();" href="#modal2">
                                    <div class = "collapsible-header" style="background-color:grey">
                                    <i class = "material-icons">person_add</i>Friends</div>
                                    </a>
                                    <br /><asp:GridView ID="GridView2"  ShowHeader="false" runat="server" style="margin-left: 78px;margin-top: -37px;">
                         
                

                            </asp:GridView>    
                                

                            </li>

                         
                  </div>

                   <div style="margin-left:22%;">
                        <nav>
                                <div class="nav-wrapper grey">
                                        <a style="margin-left:20px;"href="#" class="brand-logo margin">Dashboard</a>
                                         <a style="margin-left:60%; margin-top:15px;"class="waves-effect waves-dark btn modal-trigger" onclick="check();" href="#modal1">Add a bill</a>
                                         <a style="margin-left:80%; margin-top:-36px;"class="waves-effect waves-dark btn modal-trigger" onclick="check4();" href="#modal4">Settle up</a>
                                   
                                         <!-- Modal Structure 1 -->
                                         <div class="container">
                                          <div id="modal1" class="modal modalwidth" >
                                             <div class="modal-content" style="color:white; padding:6px !important;width:620px !important">
                                                     <div style="background-color:#202a37">
                                                             <div style="font-size:25px; text-align:center;">Add a bill</div>
                                                              <a style="position:absolute; left:91%; margin-top:-80px;" href="#!" onclick="check6();" ><i class = "material-icons">cancel</i></a>
                                                     <li style="background-color:black" class="divider"></li></div>
                                                     <div style="color:black;">
                                                                With you and :<input style="width:50px;color:black;text-align:center" autocomplete="off" type="text"  placeholder="2" id="member" onchange="addFields();" name="member_name">others.

    <div id="container"></div>

     <div class="container" style="color:black; margin-left:20px;display:inline;">
                           
                                                       
                                                   <div >
                                                            
                                                            <i class="large material-icons" style="font-size:60px;position: relative;
    top: 15px; margin-left:50px">receipt</i><input style=" width:330px; margin-left:138px;position: relative;
    top: -55px;"type="text" name="description" autocomplete="off" placeholder="Enter a description"/>
                                                            <input style=" width:62px; margin-left:16px;position: relative;
    top: -55px;" type="text" name="money" id="total" autocomplete="off" placeholder="Rs."/>
                                                        </div>  
                                                   
                                                                                                      <div >
                                                        Paid by you and split:&nbsp;<a runat="server" onserverclick="Unnamed_ServerClick3" class="waves-effect waves-dark btn">Equally</a>&nbsp;<a class="waves-effect waves-dark btn" onclick="addExactAmount();">Exact Amount</a>&nbsp;<a class="waves-effect waves-dark btn" onclick="addExactAmount1();">Percent %</a>
                                                        <div id="exact"></div>
                                                                                                         
                                                    </div>
                                              </div>
                                                                
                                                    
                                                     </div>
                                                     
                                                <li style="background-color:black" class="divider"></li>
                                                <div class="modal-footer " style="background-color:white;">
                                                <a  class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
                                                
                                                </div>
                                              
                                        </div>
                                                                
                                        </div>
                                        
                                  </div>

                                         <!--Group Modal Structure -->
                                         <div class="container">
                                          <div id="modal3" class="modal modalwidth" >
                                             <div class="modal-content" style="color:white; padding:6px !important;width:620px !important">
                                                     <div style="background-color:#202a37">
                                                             <div style="font-size:25px; text-align:center;">Create Group</div>
                                                              <li style="background-color:black" class="divider"></li></div>
                                                     <div style="color:black;">
                                                                Group Name:&nbsp;&nbsp;&nbsp;<input style="width:200px;color:black;" autocomplete="off"  type="text" name="member_name" value="" required></li>
                                                     </div>
                                                     <div style="color:black;">
                                                                With you and :<input style="width:50px;color:black;text-align:center" type="text" autocomplete="off" id="member1" onchange="addGroupFields();" name="member" required>others.

    <div id="container1"></div>

     <div class="container" style="color:black; margin-left:20px;display:inline;">
                           
                                                       
                                                   
                                                   
                                                                                                   
                                              </div>
                                                                
                                                    
                                                     
                                                     
                                                <li style="background-color:black" class="divider"></li>
                                                <div class="modal-footer " style="background-color:white;">
                                                <a  class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
                                                <a class="waves-effect waves-dark btn" runat="server" onserverclick="Unnamed_ServerClick2" onclick="AddExpense();">Create</a>
                                                </div>
                                                
                                        </div>
                                                                
                                        </div>
                                        
                                  </div>

                                  <!--friend modal-->
                                    
                                            <div class="container">
                                          <div id="modal2" class="modal modalwidth" >
                                             <div class="modal-content" style="color:white; padding:6px !important;">
                                                     <div style="background-color:#202a37">
                                                             <div style="font-size:25px; text-align:center;">Add Friend</div>
                                                     <li style="background-color:black" class="divider"></li></div>
                                         
                                                      <div style="color:black;">
                                                         Friend Email:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSearch123" style="width:450px" placeholder="Enter email address" AutoComplete="Off" runat="server" />
   
                                                                
                                                     </div>
                                                <li style="background-color:black" class="divider"></li>
                                                <div class="modal-footer " style="background-color:white;">
                                                <a href="#!"  class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
                                                <a  runat="server" onserverclick="Unnamed_ServerClick" class="modal-action modal-close waves-effect waves-green btn-flat ">Add</a>
                                                </div>
                                               
                                        </div>
                                                                
                                        </div>

                                        <!--data list to populate owe fields-->
                                                 <asp:DataList ID="CurrentElectionDataList" ItemStyle="float:left;margin-left:-30px" RepeatDirection="Vertical" RepeatColumns="4" CellPadding="15" runat="server" EnableViewState="False" BackColor="Transparent" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"  CellSpacing="20" GridLines="Horizontal">
           
            <ItemStyle BackColor="Transparent" ForeColor="#000000" font-name="	Cursive"
               font-size="11" />
        <ItemTemplate>
        <h3><asp:Label ID="ProductNameLabel" runat="server" Style=" font-size:15px"
            Text='<%# Eval("Name") %>' /></h3>
            <table style="border-radius:2px" border="0">
            <tr style="border-radius:8px">
                <td class="ProductPropertyLabel"><b>Owes You:</b></td>
                
                <td><asp:Label ID="CategoryNameLabel" style="margin-left:-40px" runat="server" 
                    Text='<%# Eval("AmountOwned") %>' /></td>
                    </tr>
                   
        </table>

        </ItemTemplate>
            <SelectedItemStyle BackColor="#343477" Font-Bold="True" ForeColor="black" />
            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
        </asp:DataList>

    
      <asp:DataList ID="DataList1" ItemStyle="float:left;margin-left:-30px" RepeatDirection="Vertical" RepeatColumns="4" CellPadding="15" runat="server" EnableViewState="False" BackColor="Transparent" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"  CellSpacing="20" GridLines="Vertical">
           
            <ItemStyle BackColor="Transparent" ForeColor="#000000" font-name="	Cursive"
               font-size="11" />
        <ItemTemplate>
        <h3><asp:Label ID="ProductNameLabel" runat="server" Style=" font-size:15px"
            Text='<%# Eval("Name") %>' /></h3>
            <table style="border-radius:2px" border="0">
            <tr style="border-radius:8px">
                <td class="ProductPropertyLabel"><b>You owe:</b></td>
                
                <td><asp:Label ID="CategoryNameLabel" style="margin-left:-40px" runat="server" 
                    Text='<%# Eval("AmountOwned") %>' /></td>
                    </tr>
                   
        </table>

        </ItemTemplate>
            <SelectedItemStyle BackColor="#343477" Font-Bold="True" ForeColor="black" />
            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
        </asp:DataList>
        <!--end of data list-->
    
                                  </div>

                                  <!--end modal-->

                                  <!--modal 4-->

                                  <div class="container">
                                        <div id="modal4" class="modal modalwidth" >
                                           <div class="modal-content" style="color:white; padding:6px !important;">
                                              <div style="background-color:#202a37">
                                              <div style="font-size:25px; text-align:center;">Settle up!
                                                <a style="position:absolute; left:95%; margin-top:-18px;" href="#!" onclick="check5();" ><i class = "material-icons">cancel</i></a>
                                              </div>
                                              <li style="background-color:black" class="divider"></li></div>
                                              <div style="color:black; margin-left:20px;">
                                                      <p style="margin-left:7%; display:inline;">Pay Rs.</p><input style="width:100px; margin-left:10px;"type="text" name="money1" placeholder="Amount"/>to
                                                      <input style="width:330px; margin-left:10px;"type="text" name="email" placeholder="Enter e-mail address"/>
                                                </div>
                                              <li style="background-color:black" class="divider"></li>
                                              <div class="modal-footer " style="background-color:white;">
                                              <a href="#!"  class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
                                              <a href="#!"  class="modal-action modal-close waves-effect waves-green btn-flat " runat="server" onserverclick="Unnamed_ServerClick4">Save!</a>
                                              </div>        
                                            </div>
                                      </div>
                                </div>
                                 
                                  
                                </div>
                        </nav>
                      
                   </div>
                   
           <!-- ASP hidden fields to store private data-->
            <asp:HiddenField ID="hfCustomerId" runat="server" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            
      </form>
  
    </body>
</HTML>
