<script lang="ts">
	import onSubmit from '../../Util/submit';
	import { showCourseAddBar } from '../../store/store';
	import { createCourse } from '../../Api/courseApi';
	let showAddBar: boolean;
	export let loadCourse: any;
	showCourseAddBar.subscribe((value) => {
		showAddBar = value;
	});

	const addBarShowHandle = () => {
		showCourseAddBar.set(!showAddBar);
	};

	const onHandleSubmit = async (e: any) => {
		let data = onSubmit(e);
		const course = await createCourse(data);
		loadCourse();
		addBarShowHandle();
	};
</script>

<div class=" relative bg-white">
	<!-- svelte-ignore a11y-click-events-have-key-events -->
	<!-- svelte-ignore a11y-no-static-element-interactions -->
	<div on:click={addBarShowHandle} class="absolute top-2 right-2 w-5 h-5 bg-red-900 rounded-md" />
	<div class="flex justify-center items-center p-6">
		<p class="font-bold text-2xl">Add Form</p>
	</div>
	<form on:submit|preventDefault={onHandleSubmit}>
		<div class="mb-6 mx-7">
			<label for="name" class="block mb-2 text-sm font-medium text-black">Course Name</label>
			<input
				type="text"
				id="name"
				name="name"
				class="shadow-sm bg-gray-50 border border-gray-500 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
				required
			/>
		</div>
		<div class="mb-6 mx-7">
			<label for="description" class="block mb-2 text-sm font-medium text-black"
				>Course Description</label
			>
			<input
				type="text"
				id="description"
				name="briefDescription"
				class="shadow-sm bg-gray-50 border border-gray-500 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
				required
			/>
		</div>
		<div class="mb-6 mx-7">
			<button type="submit" class="bg-teal-800 py-2 w-full rounded-xl mb-10">Submit</button>
		</div>
	</form>
</div>
