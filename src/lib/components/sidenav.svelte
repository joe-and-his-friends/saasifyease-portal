<script lang="ts">
	import type { SidebarSection } from '../../types/sidebarSection';

	export let sections: SidebarSection[];

	let activeSectionIndex = 0;

	function setActiveSection(index: number) {
		activeSectionIndex = index;
	}
</script>

<div class="flex">
	<div class="w-1/5 sticky top-10">
		<nav class="flex flex-col space-y-4 mt-4 border-l border-gray-300">
			{#each sections as sec, index}
				<a
					href={`#${sec.name}`}
					class="pl-4 text-gray-500"
					class:font-medium={activeSectionIndex === index}
					class:text-black={activeSectionIndex === index}
					class:border-l-4={activeSectionIndex === index}
					class:border-blue-500={activeSectionIndex === index}
					on:click={() => setActiveSection(index)}
				>
					{sec.name}
				</a>
			{/each}
		</nav>
	</div>
	<div class="flex-1 p-8">
		{#each sections as section}
			<section id={`${section.name}`} class="pt-5">
				<slot {section}/>
			</section>
		{/each}
	</div>
</div>

