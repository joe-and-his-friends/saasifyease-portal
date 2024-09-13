<script lang="ts">
	import { onDestroy } from 'svelte';
	import { _, locale } from 'svelte-i18n';

	let aboutusData: any;

	async function loadLanguageData(language: string) {
		const module = await import(`$lib/assets/data/aboutUs/${language}.json`);
		aboutusData = module.default[0];
	}

	const unsubscribe = locale.subscribe((value) => {
		loadLanguageData(value as string);
	});

	onDestroy(() => {
		unsubscribe();
	});
</script>

{#if aboutusData}
	<div class="bg-white py-8">
		<h2 class="text-3xl font-bold text-center mb-8">{aboutusData.title}</h2>
		<div class="grid grid-cols-1 md:grid-cols-3 gap-8 container mx-auto px-4">
			{#each aboutusData?.sections as sec}
				<div
					class="flex flex-col items-center text-center border p-6 rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300"
				>
					<img
						src={sec.image.src}
						alt={sec.image.alt}
						class="w-24 h-24 rounded-full mb-4 object-cover"
					/>
					<h3 class="text-xl font-semibold text-gray-800 mb-2">{sec.name}</h3>
					<p class="text-gray-600">{sec.description}</p>
				</div>
			{/each}
		</div>
	</div>
{/if}

<style>
	img {
		object-fit: cover;
	}
</style>
