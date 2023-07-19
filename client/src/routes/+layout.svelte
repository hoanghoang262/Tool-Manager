<script lang="ts">
	import '../app.css';
	import Narbar from '../Component/narbar.svelte';
	import Footer from '../Component/footer.svelte';
	import { page } from '$app/stores';

	let currentUrl: String | null = '';
	$: currentUrl = $page.route.id;
</script>

{#if currentUrl == '/SignIn' || currentUrl == '/SIgnUp'}
	<slot />
{:else}
	<main>
		<Narbar />
		<div class="h-16 w-screen" />
		<slot />
		<Footer />
	</main>
{/if}
