<script lang="ts">
	import { onDestroy } from 'svelte';
	import { _, locale } from 'svelte-i18n';

	let solutionsData: any;

	async function loadLanguageData(language: string) {
		const module = await import(`$lib/assets/data/solutions/${language}.json`);
		solutionsData = module.default;
	}

	const unsubscribe = locale.subscribe((value) => {
		loadLanguageData(value as string);
	});

	onDestroy(() => {
		unsubscribe();
	});
</script>

<h1>{$_('common.comingSoon')}</h1>
