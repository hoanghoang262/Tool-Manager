const onSubmit = (e: any) => {
	const formData = new FormData(e.target);

	const data: any = {};
	for (const field of formData) {
		const [key, value] = field;
		data[key] = value;
	}
	return data;
};

export default onSubmit;
