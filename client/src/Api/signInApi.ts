import axios from 'axios';

async function signIn(data: any) {
	try {
		const response = await axios.post(`http://localhost:3000/auth/confirm`, data);
		const res = response.data;
		return res;
		// Do something with the received data
	} catch (error) {
		// Handle any errors
		console.log(error);
	}
}

export default signIn;
