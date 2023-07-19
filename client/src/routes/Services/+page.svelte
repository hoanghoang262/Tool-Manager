<script lang="ts">
	import Card from './card.svelte';
	import { getAllCourse } from '../../Api/courseApi';
	import { onMount } from 'svelte';
	import Add from './add.svelte';
	import { showCourseAddBar } from '../../store/store';

	let courses: any = [];
	let showAddBar: boolean;

	showCourseAddBar.subscribe((value) => {
		showAddBar = value;
	});

	const loadCourses = async () => {
		courses = await getAllCourse();
		console.log(courses);
	};

	const addBarShowHandle = () => {
		showCourseAddBar.set(!showAddBar);
	};

	onMount(() => loadCourses());
</script>

<div class="focus:outline-none relative">
	<div class="flex justify-end container mx-auto">
		<button on:click={addBarShowHandle} class="px-4 py-2 mt-5 rounded-md bg-teal-800 mr-2"
			>Add</button
		>
	</div>
	{#if showAddBar}
		<div class="absolute top-0 right-0 w-screen h-[calc(100vh-64px)] bg-black opacity-60" />
		<div class="absolute flex justify-center items-center w-screen h-[calc(100vh-64px)]">
			<div class="w-1/3"><Add loadCourse={loadCourses} /></div>
		</div>
	{/if}
	<div class="mx-auto container py-8">
		<div class="flex flex-wrap items-center lg:justify-between justify-center">
			{#each courses as course}
				<Card courseData={course} />
			{/each}
		</div>
	</div>
</div>
