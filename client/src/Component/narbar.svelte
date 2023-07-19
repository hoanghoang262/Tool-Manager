<script lang="ts">
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import { userAccount } from '../store/store';

	let showDropdown: boolean = false;
	let timeout: any;
	let currentUrl: String | null = '';
	let isSignin: Boolean = false;
	let userAccountValue: any;

	$: currentUrl = $page.route.id;

	userAccount.subscribe((value) => {
		userAccountValue = value;
	});

	$: if (userAccountValue != null) {
		isSignin = true;
	} else {
		isSignin = false;
	}
	function handleMouseEnter() {
		clearTimeout(timeout);
		showDropdown = true;
	}

	function handleMouseLeave() {
		// Delay hiding the dropdown to allow moving the mouse from the avatar to the dropdown
		timeout = setTimeout(() => {
			showDropdown = false;
		}, 200);
	}

	function Logout() {
		userAccount.set(null);
	}
</script>

<nav class="bg-white border-gray-200 fixed w-screen dark:bg-gray-900 z-30 h-16">
	<div class="max-w-[90%] h-16 flex flex-wrap items-center justify-between mx-auto p-4">
		<a href="/" class="flex items-center">
			<img src="https://flowbite.com/docs/images/logo.svg" class="h-8 mr-3" alt="Flowbite Logo" />
			<span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white"
				>HappyPrograming</span
			>
		</a>
		<button
			data-collapse-toggle="navbar-default"
			type="button"
			class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
			aria-controls="navbar-default"
			aria-expanded="false"
		>
			<span class="sr-only">Open main menu</span>
			<svg
				class="w-5 h-5"
				aria-hidden="true"
				xmlns="http://www.w3.org/2000/svg"
				fill="none"
				viewBox="0 0 17 14"
			>
				<path
					stroke="currentColor"
					stroke-linecap="round"
					stroke-linejoin="round"
					stroke-width="2"
					d="M1 1h15M1 7h15M1 13h15"
				/>
			</svg>
		</button>
		<div class="hidden w-full md:block md:w-auto" id="navbar-default">
			<ul
				class="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700"
			>
				<li>
					<a
						href="/"
						class={'block py-2 pl-3 pr-4  rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0  md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ' +
							(currentUrl === '/' ? 'dark:text-blue-700' : 'dark:text-white')}
						aria-current="page">Home</a
					>
				</li>
				<li>
					<a
						href="/About"
						class={'block py-2 pl-3 pr-4  rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0  md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ' +
							(currentUrl === '/About' ? 'dark:text-blue-700' : 'dark:text-white')}>About</a
					>
				</li>
				<li>
					<a
						href="/Services"
						class={'block py-2 pl-3 pr-4  rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0  md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ' +
							(currentUrl === '/Services' ? 'dark:text-blue-700' : 'dark:text-white')}>Services</a
					>
				</li>
				<li>
					<a
						href="Pricing"
						class={'block py-2 pl-3 pr-4  rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0  md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ' +
							(currentUrl === '/Pricing' ? 'dark:text-blue-700' : 'dark:text-white')}>Pricing</a
					>
				</li>
				<li>
					<a
						href="Contact"
						class={'block py-2 pl-3 pr-4  rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0  md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ' +
							(currentUrl === '/Contact' ? 'dark:text-blue-700' : 'dark:text-white')}>Contact</a
					>
				</li>
			</ul>
		</div>

		<!--avata-->
		{#if isSignin}
			<div class="group flex gap-3 items-center">
				<div
					role="button"
					tabindex="0"
					on:mouseenter={handleMouseEnter}
					on:mouseleave={handleMouseLeave}
					class="h-10 w-10 hover:ring-4 user cursor-pointer relative ring-blue-700/30 rounded-full bg-cover bg-center bg-[url('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80')]"
				>
					{#if showDropdown}
						<div
							role="button"
							tabindex="0"
							on:mouseenter={handleMouseEnter}
							on:mouseleave={handleMouseLeave}
							class="drop-down w-48 overflow-hidden bg-white rounded-md shadow absolute top-12 right-3"
						>
							<ul>
								<li
									class="px-3 py-3 text-sm font-medium flex items-center space-x-2 hover:bg-slate-400"
								>
									<span>
										<svg
											xmlns="http://www.w3.org/2000/svg"
											class="h-5 w-5"
											fill="none"
											viewBox="0 0 24 24"
											stroke="currentColor"
										>
											<path
												stroke-linecap="round"
												stroke-linejoin="round"
												stroke-width="2"
												d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"
											/>
											<path
												stroke-linecap="round"
												stroke-linejoin="round"
												stroke-width="2"
												d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
											/>
										</svg>
									</span>
									<span> Setting </span>
								</li>
								<li
									class="px-3 py-3 text-sm font-medium flex items-center space-x-2 hover:bg-slate-400"
								>
									<span>
										<svg
											xmlns="http://www.w3.org/2000/svg"
											class="h-6 w-6"
											fill="none"
											viewBox="0 0 24 24"
											stroke="currentColor"
										>
											<path
												stroke-linecap="round"
												stroke-linejoin="round"
												stroke-width="2"
												d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"
											/>
										</svg>
									</span>
									<span> Wishlist </span>
								</li>
								<!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
								<!-- svelte-ignore a11y-click-events-have-key-events -->
								<li
									class="px-3 py-3 text-sm font-medium flex items-center space-x-2 hover:bg-slate-400"
									on:click={Logout}
								>
									<span>
										<svg
											xmlns="http://www.w3.org/2000/svg"
											class="h-6 w-6"
											fill="none"
											viewBox="0 0 24 24"
											stroke="currentColor"
										>
											<path
												stroke-linecap="round"
												stroke-linejoin="round"
												stroke-width="2"
												d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"
											/>
										</svg>
									</span>
									<span> Logout </span>
								</li>
							</ul>
						</div>
					{/if}
				</div>
				<div class="sm:hidden cursor-pointer" id="mobile-toggle">
					<svg
						xmlns="http://www.w3.org/2000/svg"
						class="h-6 w-6"
						fill="none"
						viewBox="0 0 24 24"
						stroke="currentColor"
					>
						<path
							class="dark:stroke-white"
							stroke-linecap="round"
							stroke-linejoin="round"
							stroke-width="2"
							d="M4 6h16M4 12h16M4 18h16"
						/>
					</svg>
				</div>
			</div>
		{:else}
			<ul
				class="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700"
			>
				<li>
					<a
						href="/SignIn"
						class={'block py-2 pl-3 pr-4  rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0  md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ' +
							(currentUrl === '/SignIn' ? 'dark:text-blue-700' : 'dark:text-white')}
						aria-current="page">Sign In</a
					>
				</li>
				<li>
					<a
						href="/SignUp"
						class={'block py-2 pl-3 pr-4  rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0  md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ' +
							(currentUrl === '/SignUp' ? 'dark:text-blue-700' : 'dark:text-white')}>Sign Up</a
					>
				</li>
			</ul>
		{/if}
	</div>
</nav>
