function fn() {
	var config = {
		env: karate.env,


		AUTHURI: 'https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1',
		SCOPE: 'offline_access',
		GRANT_TYPE: 'password',
		USER_NAME: 'api-user2@iwt.net',
		PASSWORD: 'b3z0nV0cLO',
		CLIENT_ID: '0oahdhjkutaGcIK2M4x6',
		CONTEEXTURI: 'https://api.instantwebtools.net/v2',
		
		airlinesPayload: {

			name: 'Sri Lankan Airways',
			country: 'Sri Lanka',
			logo: 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png',
			slogan: 'From Sri Lanka',
			head_quaters: 'Katunayake, Sri Lanka',
			website: 'www.srilankaaairways.com',
			established: "1990"
		}
		
	};

	var result = karate.callSingle('classpath:Authentication/Authentication.feature', config);

	karate.log('Authentication Result: ', result);

	if (result && result.access_token) {
		config.authInfo = {
			authTime: result.time,
			authToken: result.access_token
		};
	} else {
		karate.log('Authentication failed or no access_token returned!');
	}

	return config;
}