// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/home'
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.amordemascotas.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.amordemascotas.UserRole'
grails.plugin.springsecurity.authority.className = 'com.amordemascotas.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               				access: ['permitAll']],
	[pattern: '/error',          				access: ['permitAll']],
	[pattern: '/index',          				access: ['permitAll']],
	[pattern: '/conocer-plus',    				access: ['permitAll']],
	[pattern: '/shutdown',       				access: ['permitAll']],
	[pattern: '/assets/**',      				access: ['permitAll']],
	[pattern: '**/assets/**',      				access: ['permitAll']],
	[pattern: '/**/js/**',       				access: ['permitAll']],
	[pattern: '/**/css/**',      				access: ['permitAll']],
	[pattern: '/**/images/**',   				access: ['permitAll']],
	[pattern: '/**/favicon.ico', 				access: ['permitAll']],
	[pattern: '/dbconsole/**', 	 				access: ['ROLE_ADMIN']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '**/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]