<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}   
        <div class="card-stamp">
            <div class="card-stamp-icon bg-yellow">     
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-key-off" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                    <path d="M10.17 6.159l2.316 -2.316a2.877 2.877 0 0 1 4.069 0l3.602 3.602a2.877 2.877 0 0 1 0 4.069l-2.33 2.33"></path>
                    <path d="M14.931 14.948a2.863 2.863 0 0 1 -1.486 -.79l-.301 -.302l-6.558 6.558a2 2 0 0 1 -1.239 .578l-.175 .008h-1.172a1 1 0 0 1 -.993 -.883l-.007 -.117v-1.172a2 2 0 0 1 .467 -1.284l.119 -.13l.414 -.414h2v-2h2v-2l2.144 -2.144l-.301 -.301a2.863 2.863 0 0 1 -.794 -1.504"></path>
                    <path d="M15 9h.01"></path>
                    <path d="M3 3l18 18"></path>
                </svg>
         </div>
         </div>
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">

            <#if realm.duplicateEmailsAllowed>            
                <div class="mb-3">
                    ${msg("emailInstructionUsername")}
                </div
            <#else>
                <div class="text-muted mb-3">
                    ${msg("emailInstruction")}
                </div>  
            </#if>
                
            <label for="username" class="form-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>                               
            <input type="text" id="username" name="username" class="form-control <#if messagesPerField.existsError('username')>is-invalid</#if>" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
            <#if messagesPerField.existsError('username')>
                <span id="input-error-username" class="invalid-feedback" aria-live="polite">
                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                </span>
            </#if>
                                
            <div id="kc-form-buttons" class="form-footer">
                <input class="btn btn-primary w-100" type="submit" value="${msg("doSubmit")}"/>
            </div>
            
        </form>
    <#elseif section = "info" >
         <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
            <div class="${properties.kcFormOptionsWrapperClass!}">
                <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
