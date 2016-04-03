<%--
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to You under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed  under the  License is distributed on an "AS IS" BASIS,
WITHOUT  WARRANTIES OR CONDITIONS  OF ANY KIND, either  express  or
implied.

See the License for the specific language governing permissions and
limitations under the License.
--%>
<%@ page session="false" %>
<%@ taglib uri="http://xmlns.jcp.org/portlet_3_0"  prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="static org.apache.portals.samples.AsyncDialogBean.*" %>

<portlet:defineObjects />

<h3>Async Portlet</h3>
<div class='parmbox'>
${adb.getMsg()}
<FORM  ACTION='<portlet:actionURL/>' id='<portlet:namespace/>-setParams' method='POST' enctype='application/x-www-form-urlencoded'>
   <table style='width:100%;'><tr><td align='left'>

   Delay:
   </td><td>
   <input id='<portlet:namespace/>-delay' name='<%=PARAM_DELAY%>' type='text' value='${adb.getDelay() }' size='5' maxlength='5'>
   </td><td>
   Repetitions:
   </td><td>
   <input id='<portlet:namespace/>-reps' name='<%=PARAM_REPS%>' type='text' value='${adb.getReps() }' size='5' maxlength='5'>
   </td><td>
   <input name='<%=PARAM_AUTO%>' value='<%=PARAM_AUTO%>' type='checkbox' ${adb.isAutoDispatch() ? "checked" : "" } > recursive

   </td></tr><tr><td>
   Output type:
   </td><td>
   <input type='radio' name='<%=PARAM_TYPE%>' value='<%=PARAM_TYPE_TXT%>' ${adb.getType() == "TEXT" ? "checked" : "" } > text
   </td><td>
   <input type='radio' name='<%=PARAM_TYPE%>' value='<%=PARAM_TYPE_INC%>' ${adb.getType() == "INC" ? "checked" : "" } > include
   </td><td>
   <input type='radio' name='<%=PARAM_TYPE%>' value='<%=PARAM_TYPE_FWD%>' ${adb.getType() == "FWD" ? "checked" : "" } > forward
   </td><td>
   <input type='radio' name='<%=PARAM_TYPE%>' value='<%=PARAM_TYPE_DIS%>' ${adb.getType() == "DISPATCH" ? "checked" : "" } > dispatch

   </td></tr><tr><td>
   <INPUT id ='<portlet:namespace/>-send' VALUE='execute' TYPE='submit'>
   </td><td>
   <input name='<%=PARAM_FILTER%>' value='<%=PARAM_FILTER%>' type='checkbox' ${adb.isUseFilter() ? "checked" : "" } > show filter
   </td></tr></table>
</FORM>
</div>
<div class='infobox' id='<portlet:namespace/>putResourceHere'></div>


<script>
(function () {
   var xhr = new XMLHttpRequest();
   xhr.onreadystatechange=function() {
      if (xhr.readyState==4 && xhr.status==200) {
         document.getElementById('<portlet:namespace/>putResourceHere').innerHTML=xhr.responseText;
      }
   };
   xhr.open('GET', '<portlet:resourceURL/>', true);
   xhr.send();
})();
</script>
