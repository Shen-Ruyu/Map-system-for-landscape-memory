<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%--导入java.sql包--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	</head>
	<body>
		<script>
          //当省份的选择发生变化时调用 该方法   将市县加载到下拉选择框
        function getCity()
    {
        //1.获取省份选择框的对象
        var provincesobj=document.getElementById("province");
        //2.获取市县选择框的对象
        var cityobj=document.getElementById("city");
        //3.获取被选择的省份的索引
        var index=provincesobj.selectedIndex;
        
        //alert(provincesobj[index].value+","+provincesobj[index].text);
       // 4.通过省份的索引获取它的value值，value值也是它在数组的索引值
        var value=provincesobj[index].value;
        
        //5.获取对应省份的市县数组
        var cityName=cityArr[value];
        //6.将下拉框清楚索引为0之后的，只保留第一个
        cityobj.length=1;
        //通过循环遍历市县元素给下拉框赋值
        for(var i=1;i<cityArr[value].length;i++)
        {
            cityobj.options[cityobj.options.length]=new Option(cityName[i],i);
            
        }
        
    }
 
</script>
<script src="js/info.js"></script>

<select name="province" id="province" onchange="getCity()">
                            <option value="">省份</option>                        
                               <script> 
                                for(var i=0;i<provinceArr.length;i++)    
                                {
                                    document.write("<option value='"+i+"'>"+provinceArr[i]+"</option>");
                                    
                                }
                            </script>
                        </select>
<select name="city" id="city">
<option value="">城市</option>

</select>
	</body>



</html>


