<script lang="ts">
	import { onDestroy } from 'svelte';
	import { _, locale } from 'svelte-i18n';

	let homeData: any;

	async function loadLanguageData(language: string) {
		const module = await import(`$lib/assets/data/home/${language}.json`);
		homeData = module.default;
	}

	const unsubscribe = locale.subscribe((value) => {
		loadLanguageData(value as string);
	});

	onDestroy(() => {
		unsubscribe();
	});
</script>

{#if homeData}
	{#each homeData.sections as sec}
		<div class="flex flex-col items-left">
			{#if sec.type === 'TEXT'}
				<h2 class="text-5xl my-4">{sec.content.title}</h2>
				<p class="my-4">{sec.content.description}</p>
			{:else if sec.type === 'IMAGE'}
				<img src={sec.content.src} alt={sec.content.alt} />
			{/if}
		</div>
	{/each}
{/if}
