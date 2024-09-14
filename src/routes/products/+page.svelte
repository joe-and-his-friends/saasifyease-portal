<script lang="ts">
	import { onDestroy } from 'svelte';
	import { ArrowRight, Icon } from 'svelte-hero-icons';
	import { _, locale } from 'svelte-i18n';

	let productsData: any;

	async function loadLanguageData(language: string) {
		const module = await import(`$lib/assets/data/products/${language}.json`);
		productsData = module.default;
	}

	const unsubscribe = locale.subscribe((value) => {
		loadLanguageData(value as string);
	});

	onDestroy(() => {
		unsubscribe();
	});
</script>

{#if productsData}
	<div class="grid grid-cols-2 gap-4 mt-4">
		{#each productsData as product}
			<a
				class="bg-white p-4 rounded-lg shadow-md hover:bg-gray-100"
				href={`/products/${product.name?.toLowerCase()}`}
			>
				<img src={product.image.src} alt={product.image.alt} />
				<h2 class="text-xl font-bold my-4">{product.name}</h2>
				<p class="my-4">{product.description}</p>
				<button
					class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
					on:click={() => (window.location.href = `${product?.action.url}`)}
				>
					{product?.action.label}
					<Icon src={ArrowRight} class="w-4 h-4 inline-block" />
				</button>
			</a>
		{/each}
	</div>
{/if}
