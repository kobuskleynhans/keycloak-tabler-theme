<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("pageExpiredTitle")}
        <div class="card-stamp">
            <div class="card-stamp-icon bg-grey">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-clock" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                    <circle cx="12" cy="12" r="9"></circle>
                    <polyline points="12 7 12 12 15 15"></polyline>
                 </svg>
            </div>
        </div>
    <#elseif section = "form">
        <div id="instruction1" class="container">
            <div class=mb-3>
              <a class="btn btn-primary w-100 text-capitalize" id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}&nbsp;${msg("pageExpiredMsg1")}</a>
            </div>
            <div class=mb-3>        
               <a class="btn w-100 text-capitalize" id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}&nbsp;${msg("pageExpiredMsg2")}</a>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
