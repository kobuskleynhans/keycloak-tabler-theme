<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
        <div class="card-stamp">
            <div class="card-stamp-icon bg-blue">     
            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-key" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path d="M16.555 3.843l3.602 3.602a2.877 2.877 0 0 1 0 4.069l-2.643 2.643a2.877 2.877 0 0 1 -4.069 0l-.301 -.301l-6.558 6.558a2 2 0 0 1 -1.239 .578l-.175 .008h-1.172a1 1 0 0 1 -.993 -.883l-.007 -.117v-1.172a2 2 0 0 1 .467 -1.284l.119 -.13l.414 -.414h2v-2h2v-2l2.144 -2.144l-.301 -.301a2.877 2.877 0 0 1 0 -4.069l2.643 -2.643a2.877 2.877 0 0 1 4.069 0z"></path>
                <path d="M15 9h.01"></path>
             </svg>
        </div>
        </div>
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" autocomplete="none" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <#if !usernameHidden??>
                    <div class="mb-3">
                        <label for="username" class="form-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                        <input aria-autocomplete="none" tabindex="1" id="username" autocomplete="false" class="form-control <#if messagesPerField.existsError('username','password')>is-invalid</#if>" name="username" value="${(login.username!'')}"  type="text" autofocus aria-autocomplete="none"                            
                        />

                        <#if messagesPerField.existsError('username','password')>
                            <span id="input-error" class="invalid-feedback" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>

                    </div>
                </#if>

                <div class="mb-2">
                    <label for="password" class="form-label">${msg("password")}
                        <#if realm.resetPasswordAllowed>
                            <span class="form-label-description"><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                        </#if>
                    </label>
                    <div class="input-group input-group-flat">
                        <input tabindex="2" id="password" autocomplete="false" class="form-control" name="password" type="password" aria-autocomplete="none" />
                        
                        <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="mb-2">
                    <label class="form-check" id="kc-form-options">
                        <#if realm.rememberMe && !usernameHidden??>
                            
                                    <#if login.rememberMe??>
                                        <input class="form-check-input" tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                        <span class="form-check-label">${msg("rememberMe")}</span>
                                    <#else>
                                        <input class="form-check-input" tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                                        <span class="form-check-label">${msg("rememberMe")}</span>
                                    </#if>
                            
                        </#if>
                  </label>
                 </div>
                  <div id="kc-form-buttons" class="form-footer">
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <input tabindex="4" class="btn btn-primary w-100" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                  </div>
            </form>
        </#if>

    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            ${msg("noAccount")} 
            <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>              
        </#if>
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
        <div class="hr-text">or</div>
            <div id="kc-social-providers" class="p-3">
                    <#list social.providers as p>
                    <div class="row w-75 p-1 m-auto">                                                                                
                        <a id="social-${p.alias}" class="btn" type="button" href="${p.loginUrl}">
                            <#if p.displayName = "Google">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-google" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M17.788 5.108a9 9 0 1 0 3.212 6.892h-8"></path>
                             </svg>
                            <#elseif p.displayName = "Facebook">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-facebook" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M7 10v4h3v7h4v-7h3l1 -4h-4v-2a1 1 0 0 1 1 -1h3v-4h-3a5 5 0 0 0 -5 5v2h-3"></path>
                             </svg>
                            <#elseif p.displayName = "Twitter">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-twitter" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M22 4.01c-1 .49 -1.98 .689 -3 .99c-1.121 -1.265 -2.783 -1.335 -4.38 -.737s-2.643 2.06 -2.62 3.737v1c-3.245 .083 -6.135 -1.395 -8 -4c0 0 -4.182 7.433 4 11c-1.872 1.247 -3.739 2.088 -6 2c3.308 1.803 6.913 2.423 10.034 1.517c3.58 -1.04 6.522 -3.723 7.651 -7.742a13.84 13.84 0 0 0 .497 -3.753c-.002 -.249 1.51 -2.772 1.818 -4.013z"></path>
                             </svg>
                            <#elseif p.displayName = "GitHub">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-github" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M9 19c-4.3 1.4 -4.3 -2.5 -6 -3m12 5v-3.5c0 -1 .1 -1.4 -.5 -2c2.8 -.3 5.5 -1.4 5.5 -6a4.6 4.6 0 0 0 -1.3 -3.2a4.2 4.2 0 0 0 -.1 -3.2s-1.1 -.3 -3.5 1.3a12.3 12.3 0 0 0 -6.2 0c-2.4 -1.6 -3.5 -1.3 -3.5 -1.3a4.2 4.2 0 0 0 -.1 3.2a4.6 4.6 0 0 0 -1.3 3.2c0 4.6 2.7 5.7 5.5 6c-.6 .6 -.6 1.2 -.5 2v3.5"></path>
                             </svg>
                            <#elseif p.displayName = "LinkedIn">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-linkedin" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <rect x="4" y="4" width="16" height="16" rx="2"></rect>
                                <line x1="8" y1="11" x2="8" y2="16"></line>
                                <line x1="8" y1="8" x2="8" y2="8.01"></line>
                                <line x1="12" y1="16" x2="12" y2="11"></line>
                                <path d="M16 16v-3a2 2 0 0 0 -4 0"></path>
                             </svg>
                            <#elseif p.displayName = "GitLab">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-gitlab" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M21 14l-9 7l-9 -7l3 -11l3 7h6l3 -7z"></path>
                             </svg>
                            <#elseif p.displayName = "Bitbucket">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-bitbucket" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M3.648 4a0.64 .64 0 0 0 -.64 .744l3.14 14.528c.07 .417 .43 .724 .852 .728h10a0.644 .644 0 0 0 .642 -.539l3.35 -14.71a0.641 .641 0 0 0 -.64 -.744l-16.704 -.007z"></path>
                                <path d="M14 15h-4l-1 -6h6z"></path>
                             </svg>
                            <#elseif p.displayName = "Stack Overflow">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-stackoverflow" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M4 17v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-1"></path>
                                <path d="M8 16h8"></path>
                                <path d="M8.322 12.582l7.956 .836"></path>
                                <path d="M8.787 9.168l7.826 1.664"></path>
                                <path d="M10.096 5.764l7.608 2.472"></path>
                             </svg>
                            <#elseif p.displayName = "YouTube">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-youtube" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <rect x="3" y="5" width="18" height="14" rx="4"></rect>
                                <path d="M10 9l5 3l-5 3z"></path>
                             </svg>
                            <#elseif p.displayName = "Microsoft">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-windows" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M17.8 20l-12 -1.5c-1 -.1 -1.8 -.9 -1.8 -1.9v-9.2c0 -1 .8 -1.8 1.8 -1.9l12 -1.5c1.2 -.1 2.2 .8 2.2 1.9v12.1c0 1.2 -1.1 2.1 -2.2 1.9z"></path>
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="4" y1="12" x2="20" y2="12"></line>
                             </svg>
                            </#if>
                            Login with ${p.displayName!}                          
                        </a>                                                                    
                    </div>
                    </#list>
   
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
