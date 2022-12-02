<#import "template.ftl" as layout>
    <@layout.registrationLayout
        displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm');
        section>
        <#if section="header">
            ${msg("registerTitle")}
            <div class="card-stamp">
                <div class="card-stamp-icon bg-blue">
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user-plus" width="24"
                        height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path>
                        <path d="M16 11h6m-3 -3v6"></path>
                    </svg>
                </div>
            </div>
            <#elseif section="form">
                <form id="kc-register-form" action="${url.registrationAction}"
                    method="post">
                    
                  
                    <div class="mb-3">
                       
                            <label for="firstName" class="form-label">                                
                                ${msg("firstName")}
                            </label>
                       
                            <input type="text" id="firstName" class="form-control  <#if messagesPerField.existsError('firstName')>is-invalid</#if>" name="firstName"
                                value="${(register.formData.firstName!'')}"
                                aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>" />

                            <#if messagesPerField.existsError('firstName')>
                                <span id="input-error-firstname" class="invalid-feedback d-block"
                                    aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                </span>
                            </#if>
                    </div>

                    <div class="mb-3">
                       
                            <label for="lastName" class="form-label">                                
                                ${msg("lastName")}
                            </label>
                       
                            <input type="text" id="lastName" class="form-control  <#if messagesPerField.existsError('lastName')>is-invalid</#if>" name="lastName"
                                value="${(register.formData.lastName!'')}"
                                aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>" />

                            <#if messagesPerField.existsError('lastName')>
                                <span id="input-error-lastname" class="invalid-feedback d-block"
                                    aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                </span>
                            </#if>
                    </div>

                    <div class="mb-3">
                       
                            <label for="email" class="form-label">                                
                                ${msg("email")}
                            </label>
                       
                            <input type="text" id="email" class="form-control  <#if messagesPerField.existsError('email')>is-invalid</#if>" name="email"
                                value="${(register.formData.email!'')}" autocomplete="email"
                                aria-invalid="<#if messagesPerField.existsError('email')>true</#if>" />

                            <#if messagesPerField.existsError('email')>
                                <span id="input-error-email" class="invalid-feedback d-block"
                                    aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                </span>
                            </#if>
                    </div>

                    <#if !realm.registrationEmailAsUsername>
                        <div class="mb-3">
                           
                                <label for="username" class="form-label">                                    
                                    ${msg("username")}
                                </label>
                           
                                <input type="text" id="username" class="form-control  <#if messagesPerField.existsError('username')>is-invalid</#if>" name="username"
                                    value="${(register.formData.username!'')}" autocomplete="username"
                                    aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" />

                                <#if messagesPerField.existsError('username')>
                                    <span id="input-error-username" class="invalid-feedback d-block"
                                        aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                    </span>
                                </#if>
                        </div>
                    </#if>

                    <#if passwordRequired??>
                        <div class="mb-3">
                           
                                <label for="password" class="form-label">                                    
                                    ${msg("password")}
                                </label>
                           
                                <input type="password" id="password" class="form-control  <#if messagesPerField.existsError('password')>is-invalid</#if>" name="password"
                                    autocomplete="new-password"
                                    aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" />

                                <#if messagesPerField.existsError('password')>
                                    <span id="input-error-password" class="invalid-feedback d-block"
                                        aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                    </span>
                                </#if>
                        </div>

                        <div class="mb-4">                           
                                <label for="password-confirm" class="form-label">                                    
                                    ${msg("passwordConfirm")}
                                </label>
                           
                                <input type="password" id="password-confirm" class="form-control  <#if messagesPerField.existsError('password-confirm')>is-invalid</#if>"
                                    name="password-confirm"
                                    aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />

                                <#if messagesPerField.existsError('password-confirm')>
                                    <span id="input-error-password-confirm"
                                        class="invalid-feedback d-block" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                    </span>
                                </#if>
                        </div>
                    </#if>

                    <#if recaptchaRequired??>
                        <div>
                            <div class="mb-3">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                            </div>
                        </div>
                    </#if>

                    <div class="mb-2">                     
                        <div id="kc-form-buttons">
                            <input class="btn btn-primary w-100" type="submit" value="${msg("doRegister")}" />
                        </div>
                    </div>
                </form>
        </#if>    
        <#if section="info">
        <div id="kc-form-options"">            
            <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>            
        </div>
        </#if>
 
    </@layout.registrationLayout>