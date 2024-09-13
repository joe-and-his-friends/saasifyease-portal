<script lang="ts">
	import { Icon, Language } from 'svelte-hero-icons';
	import { _, locale } from 'svelte-i18n';

	let selectedLanguage = 'en';
	locale.set(selectedLanguage);

	function handleLanguageChange(event: Event) {
		locale.set(selectedLanguage);
	}
</script>

<div class="bg-white sticky top-0 z-50">
	<nav class="flex justify-start items-center md:container md:mx-auto">
		<span class="navItem"
			><a class="text-lg text-sky-500 font-bold px-10" href="/"
				>SaasifyEase</a
			></span
		>
		<span class="border-r border-gray-300 h-5"></span>
		<span class="navItem"><a href="/products">{$_('products')}</a></span>
		<span class="navItem"><a href="/solutions">{$_('solutions')}</a></span>
		<span class="navItem"><a href="/about-us">{$_('about_us')}</a></span>
		<span class="ml-auto">
			<Icon src={Language} class="w-5 h-5 p-0.5 border border-gray-300 rounded inline-block" />
		</span>
		<div class="">
			<select
				class="px-2 py-1 focus:outline-none focus:ring focus:border-blue-300 text-sm"
				bind:value={selectedLanguage}
				on:change={handleLanguageChange}
			>
				<option value="en">English</option>
				<option value="jp">日本語</option>
				<option value="zh-HK">中文繁體</option>
			</select>
		</div>
	</nav>
	<hr />
</div>

<style>
	.navItem {
		padding: 0 1rem;
		height: 2.5rem;
		display: flex;
		align-items: center;
	}

	.navItem:hover {
		background-color: #e5e7eb;
	}

	a {
		text-decoration: none;
	}
</style>
