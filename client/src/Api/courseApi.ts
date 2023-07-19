import axios from 'axios';

export const getAllCourse = async () => {
	try {
		const response = await axios.get(`http://localhost:3000/course`);
		const res = response.data;
		return res;
		// Do something with the received data
	} catch (error) {
		// Handle any errors
		console.log(error);
	}
};

export const getCourseById = async (id: number) => {
	try {
		const response = await axios.get(`http://localhost:3000/course/${id}`);
		const res = response.data;
		return res;
		// Do something with the received data
	} catch (error) {
		// Handle any errors
		console.log(error);
	}
};

export const createCourse = async (data: any) => {
	try {
		const response = await axios.post(`http://localhost:3000/course`, data);
		const res = response.data;
		return res;
		// Do something with the received data
	} catch (error) {
		// Handle any errors
		console.log(error);
	}
};

export const updateCourse = async (data: any) => {
	try {
		const response = await axios.post(`http://localhost:3000/course/${data.id}`, data);
		const res = response.data;
		return res;
		// Do something with the received data
	} catch (error) {
		// Handle any errors
		console.log(error);
	}
};

export const deleteCourse = async (id: number) => {
	try {
		const response = await axios.post(`http://localhost:3000/course/${id}`);
		const res = response.data;
		return res;
		// Do something with the received data
	} catch (error) {
		// Handle any errors
		console.log(error);
	}
};
