<#-- 分页（Page对象、链接URL、参数Map、最大页码显示数） -->  
<#macro pager page baseUrl parameterMap = {} maxShowPageCount = 4>  
    <#local currentPage = page.currentPage />  <#--当前页号-->
    <#local pageSize = page.pageSize />  <#--每页显示的记录数-->
    <#local totalsPage = page.totalsPage />  <#--总页数-->
    <#local parameter = "" />  
  
    <#local parameter = parameter + "&pageSize=" + pageSize />  
  
    <#list parameterMap?keys as key>  
        <#if parameterMap[key] != null && parameterMap[key] != "">  
            <#local parameter = parameter + "&" + key + "=" + parameterMap[key] />  
        </#if>  
    </#list>  
    <#if baseUrl?contains("?")>  
        <#local baseUrl = baseUrl + "&" />  
    <#else>  
        <#local baseUrl = baseUrl + "?" />  
    </#if>  
    <#local firstPageUrl = baseUrl + "currentPage=1" + parameter />  
    <#local lastPageUrl = baseUrl + "currentPage=" + totalsPage + parameter />  
    <#local prePageUrl = baseUrl + "currentPage=" + (currentPage - 1) + parameter />  
    <#local nextPageUrl = baseUrl + "currentPage=" + (currentPage + 1) + parameter />  
  
    <#if maxShowPageCount <= 0>  
        <#local maxShowPageCount = 4>  
    </#if>  
      
    <#local segment = ((currentPage - 1) / maxShowPageCount)?int + 1 />  
    <#local startPageNumber = (segment - 1) * maxShowPageCount + 1 />  
    <#local endPageNumber = segment * maxShowPageCount />  
    <#if (startPageNumber < 1)>  
        <#local startPageNumber = 1 />  
    </#if>  
    <#if (endPageNumber > totalsPage)>  
        <#local endPageNumber = totalsPage />  
    </#if>  
  
    <#if (totalsPage > 1)>  
    <div class="pager_area">  
        <ul class="pager">  
            <li class="pageInfo">  
                共 ${totalsPage} 页  
            </li>  
            <#-- 首页 -->  
            <#if (currentPage > 1)>  
                <li class="firstPage">  
                    <a href="${firstPageUrl}">首页</a>  
                </li>  
            <#else>  
                <li class="firstPage">  
                    <span>首页</span>  
                </li>  
            </#if>  
              
            <#-- 上一页 -->  
            <#if (currentPage > 1)>  
                <li class="prePage">  
                    <a href="${prePageUrl}">上一页</a>  
                </li>  
            <#else>  
                <li class="prePage">  
                    <span>上一页</span>  
                </li>  
            </#if>  
              
            <#if (startPageNumber > 1)>  
                <li>  
                    <a href="${baseUrl + "currentPage=" + (currentPage - 2) + parameter}">...</a>  
                </li>  
            </#if>  
              
            <#list startPageNumber .. endPageNumber as index>  
                <#if currentPage != index>  
                    <li>  
                        <a href="${baseUrl + "currentPage=" + index + parameter}">${index}</a>  
                    </li>  
                <#else>  
                    <li class="currentPage">  
                        <span>${index}</span>  
                    </li>  
                </#if>  
            </#list>  
              
            <#if (endPageNumber < totalsPage)>  
                <li>  
                    <a href="${baseUrl + "currentPage=" + (currentPage + 2) + parameter}">...</a>  
                </li>  
            </#if>  
              
            <#-- 下一页 -->  
            <#if (currentPage < totalsPage)>  
                <li class="nextPage">  
                    <a href="${nextPageUrl}">下一页</a>  
                </li>  
            <#else>  
                <li class="nextPage">  
                    <span>下一页</span>  
                </li>  
            </#if>  
              
            <#-- 末页 -->  
            <#if (currentPage < totalsPage)>  
                <li class="lastPage">  
                    <a href="${lastPageUrl}">末页</a>  
                </li>  
            <#else>  
                <li class="lastPage">  
                    <span>末页</span>  
                </li>  
            </#if>  
        </ul>  
        </div>  
    </#if>  
  
</#macro>  