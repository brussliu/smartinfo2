<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="dialog" id="sending_list_inputdialog" style="display:block;background-color: rgb(255,255,240);">
        <script>
            var sending_list_inputdialog = null;
            $(function () {
                sending_list_inputdialog = $("#sending_list_inputdialog").dialog({
                    title: "発送商品集計",
                    autoOpen: false,
                    resizable: true,
                    height: 700,
                    width: 1137,
                    modal: true,
                    open: function () {
                        setTimeout(function () { });
                    },
                    close: function () {
                        setTimeout(function () { });
                    },
                });
            });
        </script>
        <style>    
  
        </style>

        <div style="margin: 10px;" class="div_tab">
         
            <div style="overflow: hidden;">
                <table class="table_detail_header" style="width: 1068px;table-layout: fixed;text-align: center;">
                    <thead>
                        <tr class="header">
                            <th style="width: 90px;">商品管理番号</th>
                            <th style="width: 160px;">分類①</th>
                            <th style="width: 160px;">分類②</th>

                            <th style="width: 120px;">ASIN番号</th>
                            <th style="width: 150px;">SKU番号</th>
                            <th style="width: 120px;">LABEL番号</th>

                            <th style="width: 80px;">数量</th>
                           
                        </tr>
                    </thead>
                </table>

            </div>
            <div style="overflow-x: hidden;height: 500px; overflow-y: auto;">
                <table class=" table_detail_content" style="width: 1068px;table-layout: fixed;text-align: center;">
                    <tbody>
                        <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>
                       <tr>
                           <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                           <td>XXXXXXX</td>
                       </tr> <tr>
                        <td style="width: 90px;">P002</td>
                        <td style="width: 160px;">XXXXXXX</td>
                        <td style="width: 160px;">XXXXXXX</td>

                        <td style="width: 120px;">XXXXXXX</td>
                        <td style="width: 150px;">XXXXXXX</td>
                        <td style="width: 120px;">XXXXXXX</td>

                        <td style="width: 80px;">XXXXXXX</td>
                     
                    </tr>
                   <tr>
                       <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                       <td>XXXXXXX</td>
                   </tr> <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>
                       <tr>
                           <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                           <td>XXXXXXX</td>
                       </tr> <tr>
                            <td style="width: 90px;">P002</td>
                            <td style="width: 160px;">XXXXXXX</td>
                            <td style="width: 160px;">XXXXXXX</td>

                            <td style="width: 120px;">XXXXXXX</td>
                            <td style="width: 150px;">XXXXXXX</td>
                            <td style="width: 120px;">XXXXXXX</td>

                            <td style="width: 80px;">XXXXXXX</td>
                         
                        </tr>
                       <tr>
                           <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                           <td>XXXXXXX</td>
                       </tr> <tr>
                        <td style="width: 90px;">P002</td>
                        <td style="width: 160px;">XXXXXXX</td>
                        <td style="width: 160px;">XXXXXXX</td>

                        <td style="width: 120px;">XXXXXXX</td>
                        <td style="width: 150px;">XXXXXXX</td>
                        <td style="width: 120px;">XXXXXXX</td>

                        <td style="width: 80px;">XXXXXXX</td>
                     
                    </tr>
                   <tr>
                       <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                       <td>XXXXXXX</td>
                   </tr> <tr>
                    <td style="width: 90px;">P002</td>
                    <td style="width: 160px;">XXXXXXX</td>
                    <td style="width: 160px;">XXXXXXX</td>

                    <td style="width: 120px;">XXXXXXX</td>
                    <td style="width: 150px;">XXXXXXX</td>
                    <td style="width: 120px;">XXXXXXX</td>

                    <td style="width: 80px;">XXXXXXX</td>
                 
                </tr>
               <tr>
                   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                   <td>XXXXXXX</td>
               </tr> <tr>
                <td style="width: 90px;">P002</td>
                <td style="width: 160px;">XXXXXXX</td>
                <td style="width: 160px;">XXXXXXX</td>

                <td style="width: 120px;">XXXXXXX</td>
                <td style="width: 150px;">XXXXXXX</td>
                <td style="width: 120px;">XXXXXXX</td>

                <td style="width: 80px;">XXXXXXX</td>
             
            </tr>
           <tr>
               <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
               <td>XXXXXXX</td>
           </tr> <tr>
            <td style="width: 90px;">P002</td>
            <td style="width: 160px;">XXXXXXX</td>
            <td style="width: 160px;">XXXXXXX</td>

            <td style="width: 120px;">XXXXXXX</td>
            <td style="width: 150px;">XXXXXXX</td>
            <td style="width: 120px;">XXXXXXX</td>

            <td style="width: 80px;">XXXXXXX</td>
         
        </tr>
       <tr>
           <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
           <td>XXXXXXX</td>
       </tr> <tr>
        <td style="width: 90px;">P002</td>
        <td style="width: 160px;">XXXXXXX</td>
        <td style="width: 160px;">XXXXXXX</td>

        <td style="width: 120px;">XXXXXXX</td>
        <td style="width: 150px;">XXXXXXX</td>
        <td style="width: 120px;">XXXXXXX</td>

        <td style="width: 80px;">XXXXXXX</td>
     
    </tr>
   <tr>
       <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
       <td>XXXXXXX</td>
   </tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr> <tr>
    <td style="width: 90px;">P002</td>
    <td style="width: 160px;">XXXXXXX</td>
    <td style="width: 160px;">XXXXXXX</td>

    <td style="width: 120px;">XXXXXXX</td>
    <td style="width: 150px;">XXXXXXX</td>
    <td style="width: 120px;">XXXXXXX</td>

    <td style="width: 80px;">XXXXXXX</td>
 
</tr>
<tr>
   <td colspan="6">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
   <td>XXXXXXX</td>
</tr>
                    </tbody>
                </table>

            </div>

        </div>
    </div>