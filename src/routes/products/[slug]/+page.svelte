<script lang="ts">
	import Sidenav from '$lib/components/sidenav.svelte';
	import { onDestroy } from 'svelte';
	import { ArrowRight, Icon } from 'svelte-hero-icons';
	import { locale } from 'svelte-i18n';

	let productData: any;

	async function loadLanguageData(language: string) {
		const module = await import(`$lib/assets/data/products/${language}.json`);
		productData = module.default[0];
	}

	const unsubscribe = locale.subscribe((value) => {
		loadLanguageData(value as string);
	});

	onDestroy(() => {
		unsubscribe();
	});
</script>

<div class="flex py-8 px-8 space-x-8 bg-gray-100">
	<div class="flex flex-col flex-1">
		<h1 class="text-5xl font-bold">
			{productData?.name}
		</h1>
		<div class="mt-auto">
			<p class="py-8 text-xl">{productData?.description}</p>
			<button
				class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
				on:click={() => (window.location.href = `${productData?.action.url}`)}
			>
				{productData?.action.label}
				<Icon src={ArrowRight} class="w-4 h-4 inline-block" />
			</button>
		</div>
	</div>
	<img
		src={productData?.image.src}
		alt={productData?.image.alt}
		class="flex-1 object-contain h-auto w-1/2"
	/>
</div>
{#if productData}
	<Sidenav sections={productData.sections} let:section={row}>
		{#if row.type === 'TEXT'}
			<h2 class="text-5xl my-4">{row.content.title}</h2>
			<p class="my-4">{row.content.description}</p>
		{:else if row.type === 'IMAGE'}
			<img src={row.content.src} alt={row.content.alt} />
		{/if}
	</Sidenav>
{/if}
